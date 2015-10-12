//
//  TopicTableViewCell.swift
//  GlowProject
//
//  Created by ultra on 10/10/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    // MARK Properties
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
