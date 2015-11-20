//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/19/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var activityView: UIActivityIndicatorView!

    @IBOutlet weak var connectionStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityView.hidden = true
        connectionStatus.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkURL(sender: UIButton) {
        activityView.hidden = false
        activityView.startAnimating()
        WebService.fetchAndParseJSONFromURL("http://tednewardsandbox.site44.com/questions.json") { quizData in
            if quizData.count == 0 {
                self.connectionStatus.text = "No Connection"
            } else {
                self.connectionStatus.text = "Successful Connection"
            }
            
            self.activityView.stopAnimating()
            self.activityView.hidden = true
            self.connectionStatus.hidden = false
            print("Hello")
        }
        
    }

}
