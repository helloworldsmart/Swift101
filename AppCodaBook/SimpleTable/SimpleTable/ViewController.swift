//
//  ViewController.swift
//  SimpleTable
//
//  Created by Michael on 2020/12/14.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
  
  var restaurantImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurantNames.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "datacell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    //Set Cell
    cell.textLabel?.text = restaurantNames[indexPath.row]
    cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
    return cell
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

