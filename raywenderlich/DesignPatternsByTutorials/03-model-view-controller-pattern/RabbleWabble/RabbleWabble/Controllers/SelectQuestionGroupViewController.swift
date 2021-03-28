//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Michael on 2021/3/28.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
  // MARK: - Outlets
  @IBOutlet internal var tableView: UITableView! {
    didSet {
      tableView.tableFooterView = UIView()
    }
  }
  
  // MARK: - Properties
  public let questionGroups = QuestionGroup.allGroups()
  private var selectedQuestionGroup: QuestionGroup!
}

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questionGroups.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    return UITableViewCell()
    let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
    let questionGroup = questionGroups[indexPath.row]
    cell.titleLabel.text = questionGroup.title
    return cell
    
  }
  
}
