//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by ayubi on 19/10/15.
//  Copyright © 2015 Athvillar. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    var tweet:Tweet?{
        didSet {
            updateUI()
        }
    }

    
    @IBOutlet weak var tweetImageView: UIImageView!

    @IBOutlet weak var tweetScreenName: UILabel!
    
    
    @IBOutlet weak var tweetText: UILabel!
    
    func updateUI(){
        
    }
}
