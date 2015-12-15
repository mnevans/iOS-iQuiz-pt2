//
//  ViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/3/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    private let settingsViewController = SettingsViewController()
    private let questionSeque = "questionSegue"
    private let mathQuestions = [
        Question(question: "2 + 2", answers: ["4", "2", "6"], correctAnswer: "4"),
        Question(question: "5 - 1", answers: ["4", "3", "-2"], correctAnswer: "4"),
        Question(question: "6 + 0", answers: ["6", "1", "3"], correctAnswer: "6")
    ]
    private let marvelQuestions = [
        Question(question: "What is Spiderman's lovers name?", answers: ["Mary Jane", "Janet Marie", "Helga"], correctAnswer: "Mary Jane"),
        Question(question: "What color is the Hulk?", answers: ["Red", "Green", "Blue"], correctAnswer: "Green"),
        Question(question: "What is Spiderman's real name?", answers: ["Spidey", "Parker Peter", "Peter Parker"], correctAnswer: "Peter Parker")
    ]
    private let scienceQuestions = [
        Question(question: "What's the first color of the color spectrum?", answers: ["Orange", "Red", "Yellow"], correctAnswer: "Red"),
        Question(question: "What is the first element on the periodic table?", answers: ["Gold", "Oxygen", "Hydrogen"], correctAnswer: "Hydrogen"),
        Question(question: "What is the closest planet to the sun?", answers: ["Mercury", "Earth", "Pluto"], correctAnswer: "Mercury")
    ]
    
    private var quizzes: [String: [Question]] = ["":[]]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizzes = [
            "Mathematics": mathQuestions,
            "Marvel": marvelQuestions,
            "Science": scienceQuestions
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Event handler for pressing the settings button
    // Currently displays a pop up dialog
    /*@IBAction func settingsPressed(sender: UIBarButtonItem) {
        let title = "Settings go here"
        let controller = UIAlertController(title: title, message: nil,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        
        presentViewController(controller, animated: true, completion: nil)
    }*/
    
    // Number of mandatory rows
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return quizzes.count
    }
    
    // Make tablecells
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
                as UITableViewCell!
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
            }
            
            //let correspondingKey = Array(quizzes.keys)[indexPath.row]
            
            let image = UIImage(named: "marvel")
            cell!.imageView?.image = image
            
            cell!.textLabel?.text = Array(quizzes.keys)[indexPath.row]
            cell!.textLabel?.font = UIFont .boldSystemFontOfSize(18)
            return cell!
    }
    
    // Once we have selected a table cell
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            performSegueWithIdentifier(questionSeque, sender: cell)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == questionSeque {
            let cell = sender as! UITableViewCell
            let key = cell.textLabel?.text
            let problems = quizzes[key!]
            let questionViewController = segue.destinationViewController as! QuestionViewController
            
            questionViewController.questions = problems!
        }
    }
}

