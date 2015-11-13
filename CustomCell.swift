//
//  CustomCell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/9/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var currentFrame = textLabel?.frame
        textLabel?.frame = CGRectMake(10, -15, (textLabel?.frame.width)!, (textLabel?.frame.height)!)
        
    }
}
