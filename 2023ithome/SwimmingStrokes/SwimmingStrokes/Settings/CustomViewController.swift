//
//  CustomViewController.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/11.
//

import UIKit

class CustomViewController: UIViewController, CustomViewModelDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: CustomViewModel
    
    required init?(coder: NSCoder) {
        self.viewModel = CustomViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
    }
    
    func updateTitle(title: String) {
        self.titleLabel.text = title
    }
}
