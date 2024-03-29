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

// MARK:- UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
  // 1
  public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedQuestionGroup = questionGroups[indexPath.row]
    return indexPath
  }
  // 2
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // 3
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let viewController = segue.destination as? QuestionViewController else {
      return
    }
    viewController.questionGroup = selectedQuestionGroup
    viewController.delegate = self
  }
}

// MARK: - QuestionViewControllerDelegate
extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
  public func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int) {
    navigationController?.popToViewController(self, animated: true)
  }
  
  public func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup) {
    navigationController?.popToViewController(self, animated: true)
  }
}
