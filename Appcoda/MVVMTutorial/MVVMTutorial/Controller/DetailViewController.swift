//
//  DetailViewController.swift
//  MVVMTutorial
//
//  Created by Michael on 2021/4/18.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var messierViewModel: MessierViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        
        let imageCompletionClosure = { ( imageData: NSData ) -> Void in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0, animations: {
                    self.imageView.alpha = 1.0
                    self.imageView?.image = UIImage(data: imageData as Data)
                    self.view.setNeedsDisplay()
                })
                self.activitySpinner.stopAnimating()
            }
        }
        activitySpinner.startAnimating()
        
        titleLabel.text = messierViewModel?.formalName
        subtitleLabel.text = messierViewModel?.commonName
        updatedLabel.text = messierViewModel?.dateUpdated
        descriptionTextView.attributedText = messierViewModel?.textDescription
        
        messierViewModel?.download(completionHander: imageCompletionClosure)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
