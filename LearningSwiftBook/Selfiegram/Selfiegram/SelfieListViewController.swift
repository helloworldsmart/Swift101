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
  
  let timeIntervalFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .spellOut
    formatter.maximumUnitCount = 1
    return formatter
  }()

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
    let addSelfieButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewSelfie))
    
    navigationItem.rightBarButtonItem = addSelfieButton
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
  
  @objc func createNewSelfie() {
    let imagePicker = UIImagePickerController()
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      imagePicker.sourceType = .camera
      
      if UIImagePickerController.isCameraDeviceAvailable(.front) {
        imagePicker.cameraDevice = .front
      }
    } else {
      imagePicker.sourceType = .photoLibrary
    }
    
    imagePicker.delegate = self
    
    self.present(imagePicker, animated: true, completion: nil)
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
    
    if let interval = timeIntervalFormatter.string(from: selfie.created, to: Date()) {
      cell.detailTextLabel?.text = "\(interval) age"
    } else {
      cell.detailTextLabel?.text = nil
    }
    
    cell.imageView?.image = selfie.image
    return cell
  }
  
  // MARK: Delete
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let selfieToRemove = selfies[indexPath.row]
      
      do {
        try SelfieStore.shared.delete(selfie: selfieToRemove)
        
        selfies.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
      } catch {
        let title = selfieToRemove.title
        showError(message: "Failed to delete\(title).")
      }
    }
  }


}

extension SelfieListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage ?? info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      let message = "Couldn't get a picture from the image picker!"
      showError(message: message)
      return
    }
    
    self.newSelfieTaken(image:image)
    self.dismiss(animated: true, completion: nil)
  }
  
  func newSelfieTaken(image: UIImage) {
    let newSelfie = Selfie(title: "New Selfie")
    
    newSelfie.image = image
    
    do {
      try SelfieStore.shared.save(selfie: newSelfie)
    } catch let error {
      showError(message: "Can't save photo: \(error)")
      return
    }
    
    selfies.insert(newSelfie, at: 0)
    tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
  }
}

