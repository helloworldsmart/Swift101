//
//  VC-Extension+TableViewDelegate.swift
//  MVVMTutorial
//
//  Created by Michael on 2021/4/18.
//

import Foundation
import  UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
    }
}
