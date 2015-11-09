                           //
//  TimeCell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/5/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var separator: UIView!
    private var times = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48]
    var tableView: UITableView!
    
    
    override func layoutSubviews() {
//        tableView.separatorInset.left = 40
    
    }
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
            cell.textLabel?.text = String(times[indexPath.row])
            cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.tableView .reloadData()
    
    }

    
}
