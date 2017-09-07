//
//  RestAPIFacade.swift
//
//  Created by HASSAN RAZA on 5/30/16.
//  Copyright © 2016 HASSAN RAZA. All rights reserved.
//


import Foundation
import UIKit


enum RequestMethod: String {
    case none = "NONE"
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}


typealias Completion = (_ result:HttpResult) -> Void

class RestAPIFacade : NSObject
{
    let CACHE_TABLE: String = "result_cache"
    var urlPart: String
    var responseClass : BaseResponseModel.Type
    var requestMethod : RequestMethod = .get
    var getParams: String?
    var postParams : Dictionary<String,AnyObject>?
    var headerParams : Dictionary<String,String>?
    var isMandatory : Bool = true
    var requestType : String
    var resquestID: Int = 0
    var result: BaseResponseModel
    var contentType:ContentType = .urlEncoded
    fileprivate var _completion:Completion?
    
    
    init(requestType: String, responseType responseClass: BaseResponseModel.Type, requestMethod: RequestMethod, headers headerParams: Dictionary<String,String>?, data postParams: Dictionary<String,AnyObject>?, params getParams: String?) {
        
        self.requestType = requestType
        self.responseClass = responseClass
        self.requestMethod = requestMethod
        self.postParams = postParams
        self.getParams = getParams
        self.headerParams = headerParams
        
        
        result = responseClass.init()
        isMandatory = true
        self.urlPart = requestType
        
        
        if let extraParams = getParams {
            self.urlPart = self.urlPart.appending("?"+extraParams)
        }
    
    }

    
    func executeRequest(WithCompletion completion:@escaping Completion) {
        
        _completion = completion
        
        
        let apiEndpoint: String = Constants.Domain.BaseURL.appending(urlPart).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
        let session = URLSession.shared
        let url = URL(string: apiEndpoint)!

        
        var request = URLRequest(url: url as URL)
        request.httpMethod = self.requestMethod.rawValue
        request.timeoutInterval = 10
        

        if headerParams != nil {
            for (key,value) in headerParams! {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if postParams != nil {
            
            if let httpBody = postData(ForPostParams: postParams!, contentType: contentType) {
                request.httpBody = httpBody
            }
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        

        session.dataTask(with: request as URLRequest, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in

            if error == nil {
                
                DispatchQueue.main.async() {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            
                guard let realResponse = response as? HTTPURLResponse , realResponse.statusCode == ResponseStatus.ok.rawValue else {
                  
                    if response == nil {
                        
                        self.resultDispatchHandler(isError: true, statusCode: 601, message: "Invalid or no response")
                    }
                    
                    return
                }
            
                    if let json = self.jsonObject(ForData: data!)
                    {
                        if json is NSDictionary
                        {
                            self.result = self.responseClass.init(WithDictionary: json as! Dictionary<String, AnyObject>)
                            
                            self.resultDispatchHandler(isError: false, statusCode: (response as! HTTPURLResponse).statusCode, message: (response as! HTTPURLResponse).description)
                        }
                    }
            
            } else {
                
                self.resultDispatchHandler(isError: true, statusCode: 400, message: error!.localizedDescription)
                
            }
        }).resume()
    }
}

extension RestAPIFacade
{
    func resultDispatchHandler(isError: Bool, statusCode: Int, message: String) {
        
        if isError {
            
            DispatchQueue.main.async() {
                let error = ErrorModel(WithErrorMessage: message, statusCode: statusCode)
                
                if let completion = self._completion
                {
                    completion(.error(error))
                }
            }
        }
        else{
            
            DispatchQueue.main.async() {
                
                if let completion = self._completion
                {
                    completion(.success(self.result))
                }
            }
        }
    }
    
    
    func postData(ForPostParams params:Dictionary<String, AnyObject>, contentType:ContentType) -> Data? {
        
        var data:Data? = nil
        
        if contentType == .urlEncoded {
            
            var postString = ""
            
            for (key, value) in params {
                postString += "\(key)=\(value)&"
            }
            
            data = String(postString.characters.dropLast()).data(using: .utf8)
        }
            
        else if contentType == .json
        {
            do {
                data = try JSONSerialization.data(withJSONObject: postParams!, options: JSONSerialization.WritingOptions())
            } catch {
                data = nil
            }
        }
        
        return data
    }
    
    func jsonObject(ForData data:Data) -> Any? {
        
        var json:Any? = nil
        
        do{
            json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        }
        catch _ {
            
        }
        
        return json
    }
}
