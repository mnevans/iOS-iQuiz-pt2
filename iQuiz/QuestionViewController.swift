//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/11/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    private let ANSWER_SEGUE = "answerSegue"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    var currentQuestionIndex = 0
    var questions:[String] = []
    var answers:[String: [String]]? = nil
    var chosenAnswer: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // How many selectors we want
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // How many options we need
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers![questions[currentQuestionIndex]]!.count
    }
    
    // What each row will show
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers![questions[currentQuestionIndex]]![row]
    }
    
    // What to set as our answer
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnswer = answers![questions[currentQuestionIndex]]![row]
        //answerViewController.chosenAnswer = chosenAnswer
    }

}
