                           //
//  TimeCell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/5/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    
    
//UITableViewDataSource
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
            
            return cell
            
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
    
    
    
//UITableViewDelegate
        
        func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
            
        }
    
}
