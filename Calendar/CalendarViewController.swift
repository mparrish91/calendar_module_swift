//
//  ViewController.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/2/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate , UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var collectionView: EventsCollectionView!
    @IBOutlet weak var newTableViewHeight: NSLayoutConstraint!
    
    var lastSelectedIndex:Int?
    var recentlySelectedIndex:Int?
    
    var times =  ["00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00", "07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "24:00"]
    
    private let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = CVDate(date: NSDate()).globalDescription
        
        let submit = UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: "onSubmitButtonPressed")
        let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        submit.tintColor = UIColor.redColor()
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRectMake(0, self.view.frame.size.height - 46, self.view.frame.size.width, 46)
        toolbar.sizeToFit()
        
        
        toolbar.setItems([flex,submit], animated: true)
        self.view.addSubview(toolbar)
    }
    
    
    //Update frames for the appearing views
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
    
    
    @IBAction func onBackButtonPressed(sender: AnyObject) {
        self.calendarView.loadPreviousView()
    }
    
    
    @IBAction func onForwardButtonPressed(sender: AnyObject) {
        self.calendarView.loadNextView()
    }
    

    
    @IBAction func toWeekView(sender: AnyObject) {

        if calendarView.calendarMode == .MonthView{
            
                calendarView.changeMode(.WeekView)
        }else{
                calendarView.changeMode(.MonthView)
        }
        collectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        self.collectionView.reloadData()
    }
    
    /// Not working as expected
    @IBAction func onTodayButtonPressed(sender: AnyObject) {
//        self.viewDidLoad()
        self.calendarView.toggleCurrentDayView()
        
    }
    
    
    
    // CVCalendar library functions to display calendar and events
    
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        return false
    }
    

    func presentedDateUpdated(date: CVDate) {
        self.navigationItem.title = date.globalDescription
        print(date.commonDescription)
        print(date.month.description)
        print(date.day)
        print(date.hashValue)
        print(date.week)
        print(date.year)


        let indexPath1 = NSIndexPath(forRow: 0, inSection: 0)
        
        //load tableview
//        let cell = collectionView.cellForItemAtIndexPath(indexPath1) as! CollectionViewCell
//        
        
        
//        cell.tableView.textLabel?.text = String("Yolo")
//        cell.textLabel?.backgroundColor = UIColor.clearColor()
//        cell.textLabel?.textColor = UIColor.lightGrayColor()
//        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
//        var bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
//        cell.selectedBackgroundView = bgColorView
        
    
        
    }
 
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return false
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        if dayView.isCurrentDay{
            return true
        }
        return false
    }
    
    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor] {
        let color = UIColor.orangeColor()
        return [color]
    }

    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return false
    }
    

    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return true
    }
    
    func shouldAutoSelectDayOnWeekChange() -> Bool {
        return true
    }
    
 


//UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,height: collectionView.frame.height)
    }
    
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
}


//UICollectionViewDataSource
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TimeCell", forIndexPath: indexPath) as! CollectionViewCell
        
//        if calendarView.calendarMode == .MonthView{
        
//          cell.tableViewHeight.constant = 390
//        }else{
//            cell.tableViewHeight.constant = 500
//        }
        
        
        return cell
    }
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let user1 = User()
        user1.name = "Mike"
        user1.yearArray = [Year(term: 2015)!,Year(term: 2016)!]
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
//        cell.textLabel?.text = String(times[indexPath.row])
        
        cell.textLabel?.text = String(user1.yearArray![0].monthArray![0].dayArray[0].times[indexPath.row])
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
        
       
        print(user1.yearArray![0].monthArray![0].name)
        
        
        
        //initialize a calendarDictionary
        //call addSelectedCellsArrayToDictionary      -sets the Day model property
        
        //call selectedCells Function and pass in presented Date  - month, date, year
        //return an array of selected cells index
        //loop through that array and set the selected cells to that
        
        
        //event its own property 
        
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
        
        if indexPath == 47{
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: indexPath.row, inSection: indexPath.section), animated: false, scrollPosition: UITableViewScrollPosition.None)
            
        }else{
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section), animated: false, scrollPosition: UITableViewScrollPosition.None)
            
        }
        
        updateCount(tableView)
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        lastSelectedIndex = nil
        
        updateCount(tableView)
        
    }
    
    func updateCount(tableView:UITableView){
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
    
    
//    func isRowPresentInTableView(row: Int, section: Int) -> Bool {
//        
//        if section < tableView .numberOfSections {
//            if row < tableView .numberOfRowsInSection(1) {
//                return true
//            }
//        }
//        return false
//        
//    }
    
}



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




//        var eventTodayTask1:Event = Event()
//        eventTodayTask1.startTime = "03:30"
//
//        eventTodayTask1.startTime ==
//
//        var eventTodayTask2:Event = Event()
//        eventTodayTask1.startTime = ""
//
//
//
//        arr18th = [eventTodayTask1,eventTodayTask2]



//    var arr18th : [Event]?
//    var arrToday : [Event]?
//    var arr20th : [Event]?
//
