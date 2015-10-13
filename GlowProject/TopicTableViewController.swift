//
//  TopicTableViewController.swift
//  GlowProject
//
//  Created by ultra on 10/10/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit

// Add a new method to create hex form color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alphar:CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphar)
    }
    
    convenience init(netHex:Int,alpha:CGFloat) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff,alphar:alpha)
    }
}

class TopicTableViewController: UITableViewController {
    
    // MARK Properties
    var topics = [Topic]()
    var comments = NSMutableArray()
    var comments1 = NSMutableArray()
    
    func loadSampleTopics(){
        let image1 = UIImageView()
        image1.image = UIImage(named: "user1")
        
        let image2 = UIImageView()
        image2.image = UIImage(named: "user3")
        
        let author1 = Author(id: 1, firstName: "BanZhao", lastName: "Huang", profileImage: image1)
        let author2 = Author(id: 2, firstName: "Ultra", lastName: "Huang", profileImage: image2)
        
        let comment1 = MyComment(id: 1, content: "Hello Ultra, I am BanZhao", author: author1)
        let comment2 = MyComment(id: 2, content: "Hello Ultra, I am Huang", author: author2)
        let comment3 = MyComment(id: 3, content: "HeiHei", author: author2)
        
        comments.addObject(comment1)
        comments.addObject(comment2)
    
        comments1.addObject(comment3)
        let topic1 = Topic(id: 1, title: "Tell me about yourself", content: "Nice to meet you!", tag: "Glow", author: author1, comments: comments)
        let topic2 = Topic(id: 2, title: "Dota2 WTF Moments", content: "Enjoying youself! ssssssssdsdsdsaddddddddddddd", tag: "Dota2WTFF", author: author2, comments: comments1)
        let topic3 = Topic(id: 1, title: "How are you", content: "wahahahahhahahaha!", tag: "Younger", author: author1, comments: comments)
        topics += [topic1,topic2,topic3]
    
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
        
        //different tag at diffrent row should have different background color and text color
        
        if(indexPath.row % 3 == 0){
            cell.tagLabel.backgroundColor = UIColor(netHex: 0x915C57,alpha: 0.3)
            cell.tagLabel.textColor = UIColor(netHex:0x915C57,alpha: 0.7)
        }else if(indexPath.row % 3 == 1){
            cell.tagLabel.backgroundColor = UIColor(netHex: 0x536156,alpha: 0.3)
            cell.tagLabel.textColor = UIColor(netHex:0x536156,alpha: 0.7)
            
            cell.backgroundColor = UIColor(netHex:0xE8E8EB,alpha: 0.15)
        }else{
            cell.tagLabel.backgroundColor = UIColor(netHex: 0x9D9DB0,alpha: 0.5)
            cell.tagLabel.textColor = UIColor(netHex:0x9D9DB0,alpha: 0.8)
        }
        
        // set color
        cell.authorNameLabel.textColor =  UIColor(netHex:0x9BA678,alpha: 1)
        cell.titleLabel.textColor = UIColor(netHex:0x465449,alpha: 1)
        cell.contentLabel.textColor = UIColor(netHex:0x9BA678,alpha: 1)
        
        // When the number of response is one
        if(topic.getComments().count == 1){
            cell.commentsNumberLabel.text = "1 response"
        }else{
            cell.commentsNumberLabel.text = String(topic.getComments().count) + " responses"
        }
        
        let profileImageView = topic.getAuthor().getProfileImage()
        cell.profileImage.image = profileImageView.image
        return cell
    }
}
