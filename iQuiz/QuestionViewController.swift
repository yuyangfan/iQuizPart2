//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Yuyang Fan on 11/10/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var quiz : Quiz = Quiz(title: "", description: "", questions: [])
    var questionIndex : Int = 0
    var selectedIndex : Int = 0
    var selectedChoice : String = ""
    var score : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        questionLabel.text = quiz.questions[questionIndex].question
        
        
    }
    
    func back(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitAnswer(sender: UIButton) {
        self.performSegueWithIdentifier("showAnswer", sender: self)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return quiz.questions[questionIndex].answers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "QuestionChoiceCell"
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell?
        
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        
        let answer = quiz.questions[questionIndex].answers[indexPath.row]
        cell!.textLabel!.text = answer
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedChoice = (currCell?.textLabel?.text)!
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        let controller = segue.destinationViewController as! AnswerViewController
        controller.quiz = quiz
        controller.questionIndex = questionIndex
        controller.score = score
        controller.selectedChoice = selectedChoice
        controller.selectedIndex = selectedIndex
    }
    

}
