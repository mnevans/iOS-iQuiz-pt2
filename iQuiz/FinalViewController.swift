//
//  FinalViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/15/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var numOfCorrectsLabel: UILabel!
    @IBOutlet weak var numOfQuestionsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var numOfCorrectAnswers:Int = 0
    var questions:[Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true
        
        if numOfCorrectAnswers == questions.count {
            statusLabel.text = "Perfect score!"
        } else {
            statusLabel.text = "Test complete"
        }
        
        numOfCorrectsLabel.text = "Questions answered correctly: \(numOfCorrectAnswers)"
        numOfQuestionsLabel.text = "Total questions: \(questions.count)"
        let percent = Int((Double(numOfCorrectAnswers) / Double(questions.count)) * 100)
        scoreLabel.text = "Percentage: \(percent)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
