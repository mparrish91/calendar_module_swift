                           //
//  TimeCell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/5/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    private var selectedEvents:[String] = []
    private var event = ()
    
    private var times = ["00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00", "07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "24:00"]
    var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    
    override func layoutSubviews() {
//        tableView.separatorInset.left = 40
        
//        tableView.frame = CGRectMake(0, 0, CGFloat, CGFloat)
        
//        self.contentView.frame = self.bounds
//        self.contentView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
            self.tableViewHeight.constant = 500
            self.layoutIfNeeded()
        
        
    
    }
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
            cell.textLabel?.text = String(times[indexPath.row])
            cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.lightGrayColor()
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
    
   
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let currentcell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        let col = UIColor(red: 0, green: 0.1, blue: 0.8, alpha: 1)
        
        currentcell.backgroundColor = col
        
        
        let nextIndexPath = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
        let additioncell = tableView.cellForRowAtIndexPath(nextIndexPath)! as UITableViewCell
        
        additioncell .setSelected(true, animated: false)
        
//        
//        confirm?
//        
//        add selected cell index to array
        
        //check if indexPath exists
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //remove the row above it
        
//        remove selected cell index to array
        
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        self.tableView .reloadData()
//    
//    }
    
    
    @IBAction func onSubmitButtonPressed(sender: AnyObject) {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        
//        event += currentDate
        
        
        
        
        
    }
    
    
    
    
    func isRowPresentInTableView(row: Int, section: Int) -> Bool {
        
        if section < tableView .numberOfSections {
            if row < tableView .numberOfRowsInSection(1) {
                return true
            }
        }
        return false
        
    }
    
    
    
    
    

    
    
//    -(BOOL) isRowPresentInTableView:(int)row withSection:(int)section
//{
//    if(section < [self.tableView numberOfSections])
//    {
//        if(row < [self.tableView numberOfRowsInSection:section])
//        {
//            return YES;
//        }
//        }
//    return NO;
//    }

    
}
