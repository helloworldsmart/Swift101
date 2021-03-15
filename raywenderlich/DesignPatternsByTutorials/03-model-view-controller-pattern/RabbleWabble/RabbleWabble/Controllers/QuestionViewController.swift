//
//  ViewController.swift
//  RabbleWabble
//
//  Created by Michael on 2021/3/14.
//

import UIKit

public class QuestionViewController: UIViewController {

  // MARK: Instance Properties
  public var questionGroup = QuestionGroup.basicPhrases()
  public var questionIndex = 0
  public var correctCount = 0
  public var incorrectCount = 0
  
  public var questionView: QuestionView! {
    guard isViewLoaded else {
      return nil
    }
    return (view as! QuestionView)
  }
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    showQuestion()
  }

  private func showQuestion() {
    let question = questionGroup.questions[questionIndex]
    
    questionView.answerLabel.text = question.answer
    questionView.promptLabel.text = question.prompt
    questionView.hintLabel.text = question.hint
    questionView.answerLabel.isHidden = true
    questionView.hintLabel.isHidden = true
  }
  
  // MARK: - Actions
  @IBAction func toggleAnswerLabels(_ sender: Any) {
    questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
    questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
  }
  
  // 1
  @IBAction func handleCorrect(_ sender: Any) {
    correctCount += 1
    questionView.correctCountLabel.text = "\(correctCount)"
    showNextQuestion()
  }
  
  // 2
  @IBAction func handleIncorrect(_ sender: Any) {
    incorrectCount += 1
    questionView.incorrectCountLabel.text = "\(incorrectCount)"
    showQuestion()
  }
  
  // 3
  private func showNextQuestion() {
    questionIndex += 1
    guard questionIndex < questionGroup.questions.count else {
      // TODO: - Handle this...!
      return
    }
    showQuestion()
  }
}

