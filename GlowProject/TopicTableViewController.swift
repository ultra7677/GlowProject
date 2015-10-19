//
//  TopicTableViewController.swift
//  GlowProject
//
//  Created by ultra on 10/10/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit
import Foundation

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
    
    // load json form data from Glow_Data.json
    func loadSampleTopics(){
        
        guard let path = NSBundle.mainBundle().pathForResource("Glow_Data", ofType: "json") else{
            print("error finding file")
            return
        }
        do{ // File has been find
            let data: NSData? = NSData(contentsOfFile: path)
            if let jsonResult: NSDictionary =
                try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary{
                // get topics
                let topicArray = jsonResult["topics"] as! NSMutableArray
                    
                    for topic in topicArray{
                        // the author of ont topic
                        let author = topic["author"] as! NSDictionary
                        // the photo of author, saved in Assets.xcassets
                        let image1 = UIImageView()
                        image1.image = UIImage(named: author["profile_image"]! as! String)
                        // author1 is the author of this topic
                        let author1 = Author(id: 10001, firstName: author["first_name"]! as! String, lastName: author["last_name"]! as! String, profileImage: image1)
                        
                        // get comments for this topic
                        let commentArray = topic["comments"] as! NSMutableArray
                        // comments is the set including every comment of this topic
                        let comments = NSMutableArray()
                        
                        for comment in commentArray{
                            //get author of one comment
                            let author = comment["author"] as! NSDictionary
                            let image0 = UIImageView()
                            image0.image = UIImage(named: author["profile_image"]! as! String)
                            let author0 = Author(id: 10001, firstName: author["first_name"]! as! String, lastName: author["last_name"]! as! String, profileImage: image0)
                            let comment0 = MyComment(id: 10001 ,content: comment["content"]! as! String, author: author0)
                            //add one comment to the set
                            comments.addObject(comment0)
                        }
                        // topic0 is a topic
                        let topic0 = Topic(id: 10001, title: topic["title"]!! as! String, content: topic["content"]!! as! String, tag: topic["tag"]!! as! String, author: author1, comments: comments)
                        // add topic0 to the topics set
                        topics += [topic0]
                        
                    }
            }
        } catch let error as NSError{
            print("Error:\n \(error)")
            return
        }
    }
    
    // Transfer data between two ViewControllers
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showComments"){
            let commentTableViewController = segue.destinationViewController as! CommentTableViewController
            // get which topic user selected and then show detail of this topic
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
        cell.contentLabel.text = topic.getContent()
        
        //get the latest commender of this topic
        let latestComment = topic.getComments().objectAtIndex(topic.getComments().count-1) as! MyComment
       
        cell.authorNameLabel.text =  latestComment.getAuthor().getFirstName()
        
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
        // set profile image
        let profileImageView = latestComment.getAuthor().getProfileImage()
        cell.profileImage.image = profileImageView.image
        return cell
    }
}
