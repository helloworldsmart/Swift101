//
//  VC-Extension+TableViewDataSource.swift
//  MVVMTutorial
//
//  Created by Michael on 2021/4/18.
//

import Foundation

import UIKit

// MARK: - UITableView Data Source

extension ViewController: UITableViewDataSource {

    func numberOfSelection(in tableView: UITableView) -> Int {
      return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return messierViewModel.count
    }
    
    // #6 - why is this in a UIViewController subclass?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      
        tableViewCell?.imageView?.image = UIImage(named: messierViewModel[indexPath.row].thumbnail)
        tableViewCell?.textLabel?.text = messierViewModel[indexPath.row].formalName
        tableViewCell?.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
      
      return tableViewCell!
    }
}
