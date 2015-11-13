                           //
//  TimeCell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/5/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var lastSelectedIndex:Int?
    var recentlySelectedIndex:Int?
    private var selectedEvents:[Event] = []
    private var times = ["00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00", "07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "24:00"]
    var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    
    override func layoutSubviews() {

    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.textLabel?.text = String(times[indexPath.row])
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
        cell.selectedBackgroundView = bgColorView
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
        print(indexPath.row)
        
        
        //Code for the expanding second selection - Usablility wise I dont think its the easiest on the user
//        lastSelectedIndex = indexPath.row

//        if let lastIndex = lastSelectedIndex{
//            
//            if lastSelectedIndex < indexPath.row{
//                for var i = lastSelectedIndex; i <= indexPath.row; i!++ {
//                    tableView.selectRowAtIndexPath(NSIndexPath(forRow: i!, inSection: indexPath.section), animated: false, scrollPosition: UITableViewScrollPosition.None)
//                }
//            }else{
//                
//            }
//        }
        
        
        if indexPath == 47{
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: indexPath.row, inSection: indexPath.section), animated: false, scrollPosition: UITableViewScrollPosition.None)

        }else{
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section), animated: false, scrollPosition: UITableViewScrollPosition.None)

        }
        
        updateCount()

    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        lastSelectedIndex = nil
        
        updateCount()
        
    }
    
    func updateCount(){
        if let list = tableView.indexPathsForSelectedRows! as? [NSIndexPath] {
            print(list)
        }
    }
    
    
    @IBAction func onSubmitButtonPressed(sender: AnyObject) {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
    }

    
    func isRowPresentInTableView(row: Int, section: Int) -> Bool {
        
        if section < tableView .numberOfSections {
            if row < tableView .numberOfRowsInSection(1) {
                return true
            }
        }
        return false
        
    }
}
