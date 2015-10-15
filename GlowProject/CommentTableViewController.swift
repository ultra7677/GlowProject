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
       self.tableView.estimatedRowHeight = 144.0
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

      //  tableView.rowHeight = UITableViewAutomaticDimension
        if (indexPath.row == 0){
            cell.commentLabel.text =
            "fdfdsfjdsaklfafdfdsfjdsaklfadshjklfhadsjklfdskjlffdfdsfjdsaklfadshjklfhadsjklfdskjlffdfdsfjdsaklfadshjklfhadsjklfdskjlffdfdsfjdsaklfadshjklfhadsjklfdskjlffdfdsfjdsaklfadshjklfhadsjklfdskjlfdshjklfhadsjklfdskjlf"
        }else{
        
            let comment = topic.getComments().objectAtIndex(indexPath.row-1)
            print(comment.getContent())

            cell.commentLabel?.text = comment.getContent()
        }
        return cell
    }
    
}
