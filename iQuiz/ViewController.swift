//
//  ViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/3/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let subjects = [
        "Mathematics", "Marvel Super Heroes", "Science"]
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settings(sender: UIBarButtonItem) {
        let title = "Settings go here"
        let controller = UIAlertController(title: title, message: nil,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return subjects.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier)
                as UITableViewCell!
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellTableIdentifier)
            }
            
            let image = UIImage(named: "quiz_img")
            cell!.imageView?.image = image
            let highlightedImage = UIImage(named: "quiz_img2")
            cell!.imageView?.highlightedImage = highlightedImage
            
            cell!.textLabel?.text = subjects[indexPath.row]
            cell!.textLabel?.font = UIFont .boldSystemFontOfSize(18)
            cell!.detailTextLabel?.text = "Quizzes quizzes are so fun, quizzes are for everyone!"
            cell!.detailTextLabel?.font = UIFont.systemFontOfSize(12)
            return cell!
    }
    
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let rowValue = subjects[indexPath.row]
            let message = "You picked \(rowValue)"
            
            let controller = UIAlertController(title: "OK",
                message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Yes",
                style: .Default, handler: nil)
            controller.addAction(action)
            
            presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return indexPath.row == 0 ? 120 : 70
    }
}

