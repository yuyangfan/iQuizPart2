//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Yuyang Fan on 11/3/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    // MARK: Properties
    
    
    var quizes : [Quiz] = []
    
    
    @IBAction func Setting(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated:true, completion:nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        var question1 = Question(question: "100 + 30 = ?", correctAnswer: "130", answers:["130", "150", "160", "200"])
        var question2 = Question(question: "100 * 30 = ?", correctAnswer: "3000", answers:["1300", "3000", "2600", "30000"])
        var question3 = Question(question: "100 / 20 = ?", correctAnswer: "5", answers:["50", "100", "5", "15"])
        var question4 = Question(question: "100 - 98 = ?", correctAnswer: "2", answers:["13", "6", "2", "75"])
        
        let mathQuiz = Quiz(title: "Mathematics", description: "Test your math skills", questions: [question1, question2, question3, question4])
        
        question1 = Question(question: "How many heros are there in Fantasy 4?", correctAnswer: "4", answers:["4", "2", "14", "44"])
        question2 = Question(question: "Who is Iron Man?", correctAnswer: "Tony Stark", answers:["Tony Stark", "Jimmy Stark", "Josh Stark", "Mad Stark"])
        question3 = Question(question: "Who is not an avenger?", correctAnswer: "Batman", answers:["Iron Man", "Batman", "Hulk", "Thor"])
        question4 = Question(question: "Who is the oldest avenger?", correctAnswer: "Thor", answers:["Iron Man", "Hulk", "Thor", "Captain America"])
        
        let marvelQuiz = Quiz(title: "Marvel Super Heros", description: "How well do you know about it", questions: [question1, question2, question3, question4])
        
        question1 = Question(question: "Which one is the intro class to Science?", correctAnswer: "Science 101", answers:["Science 101", "Science 498", "Science 200", "Science 191"])
        question2 = Question(question: "Which class teaches you gravity", correctAnswer: "Physics", answers:["Math", "English", "Chemstry", "Physics"])
        question3 = Question(question: "What is the percentage of Oxygen in the air?", correctAnswer: "21%", answers:["21%", "82%", "0.2%", "36%"])
        question4 = Question(question: "What is the average gravity on earth?", correctAnswer: "9.8", answers:["12.8", "9.8", "11.8", "10.8"])
        
        let scienceQuiz = Quiz(title: "Science", description: "All about natural science", questions: [question1, question2, question3, question4])
        
        quizes = [mathQuiz, marvelQuiz, scienceQuiz]
        
        self.navigationItem.title = "Choose A Quiz"
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return quizes.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "QuizTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! QuizTableViewCell
        
        cell.nameLabel.text = quizes[indexPath.row].title
        switch cell.nameLabel.text! {
            case "Mathematics":
                cell.photoImageView.image = UIImage(named: "math")
        
            case "Marvel Super Heros":
                cell.photoImageView.image = UIImage(named: "marvel")
            
            case "Science":
                cell.photoImageView.image = UIImage(named: "science")
            
            default:
                cell.photoImageView.image = UIImage(named: "default")
        }
        
         cell.descriptions.text = quizes[indexPath.row].description

        return cell
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showQuestion" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let quiz = quizes[indexPath.row]
                let controller = segue.destinationViewController as! QuestionViewController
                controller.quiz = quiz
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = quiz.title
            }
        }

    }

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    

}
