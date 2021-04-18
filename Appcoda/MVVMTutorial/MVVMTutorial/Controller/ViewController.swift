//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by Michael on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(myRightSideBarButtonItemTapped(_:)))
//  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // #4 - If you want maintainable help, put this in a separate file
//  @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
//    print("Right navbar button item tapped. ")
//  }
  
  // #5 - OK, This should go in a UIViewController subclass
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DetailSegue" {
      // TODO: DetailViewController
      if let destinationViewController = segue.destination as? DetailViewController
      {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let index = indexPath.row
//        destinationViewController.data = dataSource[index]
        destinationViewController.messierViewModel = messierViewModel[index]
      }
    }
  }
  

  
} // end class ViewController

