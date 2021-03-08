//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by Michael on 2021/3/8.
//

import UIKit

// #1 - Why are all these protocols adopted here?
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  // #2 - why is the model in the view controller?
  let dataSource = ["one", "two", "three"]
  
  // #3 - OK, All this should go in a UIViewController subclass
  @IBOutlet weak var tableView: UITableView!

  // #3 - OK, All this should go in a UIViewController subclass
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func updateViewConstraints() {
    super.updateViewConstraints()
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(myRightSideBarButtonItemTapped(_:)))
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  // #3 - OK, All this should go in a UIViewController subclass
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }

  // #3 - OK, All this should go in a UIViewController subclass
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  // #3 - OK, All this should go in a UIViewController subclass
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // #4 - If you want maintainable help, put this in a separate file
  @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
    print("Right navbar button item tapped. ")
  }
  
  // #5 - OK, This should go in a UIViewController subclass
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowDetail" {
      // TODO: DetailViewController
      if let destinationViewController = segue.destination as? DetailViewController
      {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let index = indexPath.row
        destinationViewController.data = dataSource[index]
      }
    }
  }
  
  // #6 - why is this in a UIViewController subclass?
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // #6 - why is this in a UIViewController subclass?
  func numberOfSelection(in tableView: UITableView) -> Int {
    return 1
  }
  
  // #6 - why is this in a UIViewController subclass?
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  // #6 - why is this in a UIViewController subclass?
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    
    tableViewCell?.textLabel?.text = dataSource[indexPath.row]
    tableViewCell?.detailTextLabel?.text = dataSource[indexPath.row] + " subtitle"
    
    return tableViewCell!
  }
  
} // end class ViewController

