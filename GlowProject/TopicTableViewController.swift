//
//  TopicTableViewController.swift
//  GlowProject
//
//  Created by ultra on 10/10/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit

class TopicTableViewController: UITableViewController {
    
    // MARK Properties
    var topics = [Topic]()
    var comments = NSMutableArray()
    var comments1 = NSMutableArray()
    
    func loadSampleTopics(){
        let image = UIImage(named: "user1")
        
        let author1 = Author(id: 1, firstName: "BanZhao", lastName: "Huang", profileImage: image)
        let author2 = Author(id: 2, firstName: "Ultra", lastName: "Huang", profileImage: image)
        
        let comment1 = MyComment(id: 1, content: "Hello Ultra, I am BanZhao", author: author1)
        let comment2 = MyComment(id: 2, content: "Hello Ultra, I am Huang", author: author2)
        let comment3 = MyComment(id: 3, content: "HeiHei", author: author2)
        
        comments.addObject(comment1)
        comments.addObject(comment2)
    
        comments1.addObject(comment3)
        let topic1 = Topic(id: 1, title: "Tell me about yourself", content: "Nice to meet you!", tag: "Glow", author: author1, comments: comments)
        let topic2 = Topic(id: 2, title: "Dota2 WTF Moments", content: "Enjoying youself!", tag: "Dota2", author: author2, comments: comments1)
        topics += [topic1,topic2]
        
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showComments"){
            let commentTableViewController = segue.destinationViewController as! CommentTableViewController
            
            if let selectedTopicCell = sender as?TopicTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedTopicCell)!
                let selectedTopic = topics[indexPath.row]
                commentTableViewController.topic = selectedTopic
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data
        loadSampleTopics()
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
        return topics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TopicTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TopicTableViewCell
        
        // Fetches the appropriate topic for the data source layout.
        let topic = topics[indexPath.row]
        
        cell.tagLabel.text = topic.getTag() + " >"
        cell.titleLabel.text = topic.getTitle()
      //  cell.titleButton.setValue(1, forKey: "rownumber")
        cell.contentLabel.text = topic.getContent()
        cell.authorNameLabel.text = topic.getAuthor().getFirstName()
        
        // *Let the tagLabel's width fit with its text（still not finished）
        cell.tagLabel.backgroundColor = UIColor(red: 58, green: 0, blue: 220, alpha:0.2)
        
        
        // When the number of response is one
        if(topic.getComments().count == 1){
            cell.commentsNumberLabel.text = "1 response"
        }else{
            cell.commentsNumberLabel.text = String(topic.getComments().count) + " responses"
        }
        
        // When the text is too long
      //  cell.tagLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        cell.authorNameLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        cell.contentLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        
        let profileImageView = UIImageView(image:topic.getAuthor().getProfileImage())
        cell.profileImage = profileImageView
        
        //add at top
        /*
        if (indexPath.row == 0){
            let label1 = UILabel(frame: CGRectMake(10, 100, 200, 200))
            label1.text = "dd"
            label1.sizeToFit()
            label1.backgroundColor = UIColor(red: 10, green: 0, blue: 200, alpha: 0.5)
            tableView.addSubview(label1)
        }
        */
        return cell
    }
}
