//
//  CommentTableViewController.swift
//  GlowProject
//
//  Created by ultra on 10/11/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {

    // MARK Properties
    var topic: Topic!
    @IBOutlet var tabelView: UITableView!
    
    func loadSampleComments(){
        print(topic.getTitle())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data
        loadSampleComments()
        
       self.tableView.rowHeight = UITableViewAutomaticDimension
       self.tableView.estimatedRowHeight = 180
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
        // #warning Incomplete implementation, return the number of rows
        return topic.getComments().count+1
    }
    
 
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CommentTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CommentTableViewCell
        
        // row 0 means this is the topic detail cell
        if (indexPath.row == 0){
            cell.titleLabel.text = topic.getTitle()
            cell.authorLabel.hidden = true
            cell.createTimeLabel.hidden = true
            cell.profileImage.image = topic.getAuthor().getProfileImage().image
            cell.commentLabel.text = topic.getContent()
            
            // deal with different amout of comments for this topic
            
            /* NOTICE: 
               I haven't implement the method of views and created time of one topic,
               Since I thought its better to implement those attributes when I can run this app on a server
            */
            if(topic.getComments().count == 1) {
                cell.commentNumberLabel.text = String(topic.getComments().count) + " Comment · 350 Views"
            }else{
                cell.commentNumberLabel.text = String(topic.getComments().count) + " Comments · 350 Views"
            }
            
            cell.postByLabel.text = " Posted by" + topic.getAuthor().getFirstName() + " · 13 hours ago"
            cell.reportLabel.text = "Report this post"
            
            // set hidden label
            cell.authorLabel.hidden = true
            cell.createTimeLabel.hidden = true
          
        
        }else{
            // this area is for comments of this topic
            let comment = topic.getComments().objectAtIndex(indexPath.row-1)
            cell.commentLabel.text = comment.getContent()
            cell.authorLabel.text = comment.getAuthor().getFirstName()
            cell.createTimeLabel.text = " · 4 hours ago"
            cell.profileImage.image = comment.getAuthor().getProfileImage().image
            cell.reportLabel.text = "Report this reply"
            
            cell.commentNumberLabel.removeFromSuperview()
            cell.postByLabel.removeFromSuperview()
            
            //This code is very important, It adds constraints programmatically to keep the autolayout
            let verticalSpace = NSLayoutConstraint(item: cell.reportLabel, attribute: .Bottom, relatedBy: .Equal, toItem: cell.commentLabel, attribute: .Bottom, multiplier: 1, constant: 28)
            NSLayoutConstraint.activateConstraints([verticalSpace])
            
            // set background color for some cell
            if (indexPath.row % 2 == 1){
                 cell.backgroundColor = UIColor(netHex:0xE8E8EB,alpha: 0.3)
            }
        }
        return cell
    }
    
}
