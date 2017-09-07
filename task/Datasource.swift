//
//  MoviesDatasource.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class Datasource: NSObject  {
    
    fileprivate var data:[CellRepresentable] = []
    
    var count:Int {
        return data.count
    }
    
    subscript(index: Int) -> CellRepresentable {
        get {
            return data[index]
        }
        set(newValue) {
            data[index] = newValue
        }
    }
    
    func appendArray(objects:[CellRepresentable]) {
        data = data + objects
    }
    
    func append(object:CellRepresentable) {
        data.append(object)
    }
    
    func removeAll() {
        data.removeAll()
    }
    
    func loadData(data:[CellRepresentable]) {
        self.data = data
    }
    
}

extension Datasource : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self[indexPath.row].cell(ForTableView:tableView,  AtIndexPath:indexPath)
    }
}
