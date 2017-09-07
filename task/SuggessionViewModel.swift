//
//  SuggessionViewModel.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class SuggessionViewModel: BaseViewModel , CellRepresentable {

    var query:String
    var createdDate:String
    var timestamp:Double = 0
    var height: CGFloat = 40
    
    required init(WithModel model: BaseModel) {
        
        let suggessionModel = model as! SearchSuggession
        
        self.query = suggessionModel.query
        self.timestamp = suggessionModel.date
        self.createdDate = DateUtils.dateString(ForTimeInterval: suggessionModel.date, format: "dd-MM-YYYY hh:mm a")
        
        super.init(WithModel: model)
    }
    
    func cell(ForTableView tableView: UITableView, AtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath, style: .subtitle) as UITableViewCell
        
        cell.textLabel?.text = self.query
        cell.detailTextLabel?.text = self.createdDate
        
        return cell
    }
}
