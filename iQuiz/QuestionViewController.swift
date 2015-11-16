//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/11/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    private let ANSWER_SEGUE = "answerSegue"
    private var answerViewController = AnswerViewController()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    var currentQuestionIndex = 0
    var numOfCorrectAnswers = 0
    var questions:[Question] = []
    var chosenAnswer: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        
        questionLabel.text = questions[currentQuestionIndex].question
        answerPicker.dataSource = self
        answerPicker.delegate = self
        chosenAnswer = questions[currentQuestionIndex].answers[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Prepare answer VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == ANSWER_SEGUE {
            answerViewController = segue.destinationViewController as! AnswerViewController
            answerViewController.questions = questions
            answerViewController.chosenAnswer = chosenAnswer!
            answerViewController.currentQuestionIndex = currentQuestionIndex
            answerViewController.numOfCorrectAnswers = numOfCorrectAnswers
        }
    }
    
    func back(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // How many selectors we want
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // How many options we need
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
    // What each row will show
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questions[currentQuestionIndex].answers[row]
    }
    
    // What to set as our answer
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnswer = questions[currentQuestionIndex].answers[row]
        answerViewController.chosenAnswer = chosenAnswer!
    }

}
