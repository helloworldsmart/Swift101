//
//  MasterViewController.swift
//  Selfiegram
//
//  Created by Michael on 2020/11/26.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import UIKit

class SelfieListViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil
//  var objects = [Any]()
  var selfies: [Selfie] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    do {
      selfies = try SelfieStore.shared.listSelfies().sorted(by: { $0.created > $1.created })
    } catch let error {
      showError(message: "Failed to load selfies: \(error.localizedDescription)")
    }
    
    if let split = splitViewController {
      let controllers = split.viewControllers
      detailViewController = (controllers[controllers.count - 1]
        as? UINavigationController)?.topViewController
        as? DetailViewController
    }
    // Do any additional setup after loading the view.
//    navigationItem.leftBarButtonItem = editButtonItem
//
//    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//    navigationItem.rightBarButtonItem = addButton
//    if let split = splitViewController {
//        let controllers = split.viewControllers
//        detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//    }
  }


  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  //
  func showError(message: String) {
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    
    self.present(alert, animated: true, completion: nil)
  }

//  @objc
//  func insertNewObject(_ sender: Any) {
//    objects.insert(NSDate(), at: 0)
//    let indexPath = IndexPath(row: 0, section: 0)
//    tableView.insertRows(at: [indexPath], with: .automatic)
//  }

  // MARK: - Segues

//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "showDetail" {
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let object = objects[indexPath.row] as! NSDate
//            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//            controller.detailItem = object
//            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//            controller.navigationItem.leftItemsSupplementBackButton = true
//            detailViewController = controller
//        }
//    }
//  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selfies.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//    let object = objects[indexPath.row] as! NSDate
    let selfie = selfies[indexPath.row]
//    cell.textLabel!.text = object.description
    cell.textLabel?.text = selfie.title
    return cell
  }

//  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//    // Return false if you do not want the specified item to be editable.
//    return true
//  }

//  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        objects.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    } else if editingStyle == .insert {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//  }


}

