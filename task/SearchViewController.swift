//
//  ViewController.swift
//  task
//
//  Created by HASSAN RAZA on 21/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class SearchViewController: PaginationListViewController {
    
    @IBOutlet weak var tableBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchQueries:[SuggessionViewModel] = []
    var moviesDataSource:Datasource = Datasource()
    fileprivate let SearchResultLimit = 10
    
    
    private let estimatedRowHeight:CGFloat = 100
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        searchBar.delegate = self
        searchBar.placeholder = "Search Movies..."
        
        tableView.register(MovieCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.dataSource = moviesDataSource
        tableView.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardOpened(notify:)), name: Notification.Name("UIKeyboardWillShowNotification"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardClosed(notify:)), name: Notification.Name("UIKeyboardWillHideNotification"), object: nil)
    }
    
}


extension SearchViewController
{
    func keyboardOpened(notify:Notification) {
        
        if let userInfo = notify.userInfo {
            let value = userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue
            let rect = value.cgRectValue
            tableBottomConstraint.constant = rect.size.height
        }
    }
    
    func keyboardClosed(notify:Notification) {
        tableBottomConstraint.constant = 0
    }
    
    func getMovies(ForTitle title:String,shouldSave:Bool) {
        
        service.getMovies(ForTitle: title, page: currentPage, completion: { (result) in
            
            switch result
            {
            case .success(let response):
                
                DispatchQueue.main.async {
                    
                    self.parseMoviesResponse(response, completion: { (movies) in
                        
                        if movies.count > 0 {
                            
                            if shouldSave {
                                self.searchQueries.append(SuggessionViewModel(WithModel: SearchSuggession(query: title, date: Date().timeIntervalSince1970)))
                            }
                        }
                        else{
                            Alert.show(nil, message: "No record found!")
                        }
                    })
                    
                }
                
            case .error(let error):
                Alert.show("Error", message: error.exception)
            }
        })
    }
    
    
    func parseMoviesResponse(_ baseModel:BaseResponseModel , completion:([CellRepresentable]) -> Void ) {
        
        if let model:MovieListModel = baseModel as? MovieListModel, baseModel is MovieListModel {
            
            currentPage    = model.page
            totalResults   = model.total_results
            totalPages     = model.total_pages
            
            if model.movies.count > 0 {
                
                moviesDataSource.appendArray(objects: model.movies)
            }
        
            tableView.reloadData()
            
            completion(model.movies)
        }
    }
    
    
    func getSearchedQueries(limit:Int, accending:Bool) -> [SuggessionViewModel] {
        
        let objects = Array(searchQueries.prefix(limit)).sorted(by: { (obj1, obj2) -> Bool in
            return  accending ? obj1.timestamp < obj2.timestamp : obj1.timestamp > obj2.timestamp
        })
        
        return objects
    }
    
    func closeSearch()  {
        searchBar.resignFirstResponder()
        resetPaging()
    }
}

extension SearchViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return moviesDataSource[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if moviesDataSource.count > 0 &&
            indexPath.row == moviesDataSource.count - 1 && shouldLoadMore {
            if let text = searchBar.text {
                currentPage = nextPage
                getMovies(ForTitle: text, shouldSave: false)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = moviesDataSource[indexPath.row]
        
        if model is SuggessionViewModel {
            let searchModel = model as! SuggessionViewModel
            closeSearch()
            searchBar.text = searchModel.query
            getMovies(ForTitle: searchModel.query, shouldSave: false)
        }
    }
}

extension SearchViewController : UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        moviesDataSource.loadData(data: getSearchedQueries(limit: SearchResultLimit, accending: false))
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        moviesDataSource.removeAll()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let searchText = searchBar.text {
            closeSearch()
            getMovies(ForTitle: searchText, shouldSave: true)
        }
    }
}

