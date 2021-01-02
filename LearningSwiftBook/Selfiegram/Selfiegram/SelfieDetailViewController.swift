//
//  DetailViewController.swift
//  Selfiegram
//
//  Created by Michael on 2020/11/26.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import UIKit

class SelfieDetailViewController: UIViewController {

  @IBOutlet weak var selfieNameField: UITextField!
  @IBOutlet weak var selfieImageView: UIImageView!
  @IBOutlet weak var dateCreatedLabel: UILabel!
  
  var selfie: Selfie? {
    didSet {
        // Update the view.
        configureView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureView()
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    guard let selfie = selfie else {
      return
    }
    
    guard let selfieNameField = selfieNameField,
          let selfieImageView = selfieImageView,
      let dateCreatedLabel = dateCreatedLabel else {
        return
    }
    
    selfieNameField.text = selfie.title
    dateCreatedLabel.text = dateFormatter.string(from: selfie.created)
    selfieImageView.image = selfie.image
  }

  @IBAction func doneButtonTapped(_ sender: Any) {
    self.selfieNameField.resignFirstResponder()
    
    guard let selfie = selfie else {
      return
    }
    
    guard let text = selfieNameField?.text else {
      return
    }
    
    selfie.title = text
    
    try? SelfieStore.shared.save(selfie: selfie)
  }

  let dateFormatter = { () -> DateFormatter in
    let d = DateFormatter()
    d.dateStyle = .short
    d.timeStyle = .short
    return d
  }()


}

