//
//  ViewController.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/2/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit
import CVCalendar
import CoreData

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate , CVCalendarViewAppearanceDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    var tableView:UITableView?
    var selectedIndexs:[Int]?
    var presentDate:CVDate?
    var myEvent:String?
    var day = CVDate(date: NSDate())
    var presentDateNS:String?
    
    var events = [NSManagedObject]()
    
    var timesForDay : [String] = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]

    
    var lastSelectedIndex:Int?
    var recentlySelectedIndex:Int?
    
    
    private let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    var rows:[Int]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = CVDate(date: NSDate()).globalDescription
        self.presentDate = CVDate(date: NSDate())
        
        let submit = UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: "onSubmitButtonPressed:")
        let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        submit.tintColor = UIColor.redColor()
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRectMake(0, self.view.frame.size.height - 46, self.view.frame.size.width, 46)
        toolbar.sizeToFit()
        
        
        toolbar.setItems([flex,submit], animated: true)
        self.view.addSubview(toolbar)
    
        
        //If you need to create another user

//        var user1 = User()
//        user1.username = "mike"
//        user1.password = "abcdefg"
//        user1.signUpInBackgroundWithBlock { (success, error) -> Void in
//            print("sign up: \(success)")
//        }

        
        
//        user1.yearArray = [Year(term: 2015)!,Year(term: 2016)!]
        
//        view.addGestureRecognizer(leftSwipe)
//        view.addGestureRecognizer(rightSwipe)
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
        self.presentDate = date
        self.navigationItem.title = date.globalDescription
        
       
        
        //Convert to shortstyle NSDate
        let convertedDate = date.convertedDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        print(formatter.stringFromDate(convertedDate!))
        presentDateNS = formatter.stringFromDate(convertedDate!)
        
        
        self.tableView?.reloadData()
    }
 
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return false
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        if dayView.date.day == 7 && dayView.date.month == 3{
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
    
    
    //CVCalendarViewAppearanceDelegate
    func dayLabelWeekdayInTextColor() -> UIColor {
        let color = UIColor.greenColor()
        return color
    }
 
    func dayLabelWeekdayHighlightedBackgroundColor() -> UIColor {
        let color = UIColor.greenColor()
        return color
    }
    
    func dayLabelPresentWeekdayHighlightedBackgroundColor() -> UIColor {
        let color = UIColor.greenColor()
        return color
    }
    
    
    func dotMarkerColor() -> UIColor {
        let color = UIColor.blueColor()
        return color
    }
    
       
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        self.tableView = cell.tableView
        
        cell.textLabel!.text = self.timesForDay[indexPath.row]
        
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
        
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
        cell.selectedBackgroundView = bgColorView
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timesForDay.count
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
//        selectedIndexs?.append(indexPath)
        updateCount(tableView)
        
//        let selectedRows = tableView.indexPathsForSelectedRows
//        for i:NSIndexPath in selectedRows! {
//            if i.isEqual(indexPath) {
//                tableView.deselectRowAtIndexPath(indexPath, animated: false)
//            }
//        }
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        lastSelectedIndex = nil
        
        updateCount(tableView)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        if cell.selected {
////            cell.selected = true
//        } else {
////            cell.selected = true
//        }
//        
//        if indexPath.row == 1 {
//            cell.selected = true
//        }
//        
        
//        load from the data source
        
        if cell.textLabel!.text == "01:00" {
            cell.selected = true
        }

//        if (myEvent != nil){
//            for index in (day.selectionsArray){
//                if indexPath.row == index.row{
//                    cell.selected = true
//
//                }
//                }
//        }
    }
    
    
    func updateCount(tableView:UITableView){
        if let list = tableView.indexPathsForSelectedRows! as? [NSIndexPath] {
            print(list)
        }
    }
    
    
func onSubmitButtonPressed(sender: AnyObject) {
        let rows = self.tableView!.indexPathsForSelectedRows!.map{$0.row}
//        let rows = tableView!.indexPathsForSelectedRows
        print(rows)

//        //set that datasource
//        presentDate?.selectionsArray = rows!
//        day = CVDate(day: (presentDate?.day)!, month: (presentDate?.month)!, week: (presentDate?.week)!, year: (presentDate?.year)!)
//        day.selectionsArray = rows!
//    
    
    
        myEvent = "String"
    
        self.tableView?.reloadData()

}
//    
//    func handleSwipes(sender:UISwipeGestureRecognizer) {
//        if (sender.direction == .Left) {
//            
////            self.calendarView.toggleViewWithDate(CVCalendarDayView.date)
//        }
//        
//        if (sender.direction == .Right) {
//      
//        }
//    }
//    
//    
//    func daysBetweenDate(startDate: NSDate, endDate: NSDate) -> Int
//    {
//        let calendar = NSCalendar.currentCalendar()
//        
//        let components = calendar.components([.Day], fromDate: startDate, toDate: endDate, options: [])
//        
//        return components.day
//        
//        
//        var today:NSDate = NSDate()
//        let calender:NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//        var components:NSDateComponents = NSDateComponents()
//        components.setValue(1, forComponent: NSCalendarUnit.CalendarUnitDay)
//        var newDate:NSDate! = calender.dateByAddingComponents(components, toDate:today, options: NSCalendarOptions(0))
//        
//        print(newDate)
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
