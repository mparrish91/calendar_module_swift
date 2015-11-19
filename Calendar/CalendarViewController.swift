//
//  ViewController.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/2/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate , CVCalendarViewAppearanceDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var newTableViewHeight: NSLayoutConstraint!
    
    var tableView:UITableView?
    var selectedIndexs:[Int]?
    var presentDate:CVDate?
    let user1 = User()


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
    
        
        user1.name = "Mike"
        year0 = Year(term: 2015)!
        
        
        user1.yearArray = [Year(term: 2015)!,Year(term: 2016)!]
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
        
        //reload tableview
        
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TimeCell", forIndexPath: indexPath) as! UICollectionViewCell
        

//        if calendarView.calendarMode == .MonthView{
        
//          cell.tableViewHeight.constant = 390
//        }else{
//            cell.tableViewHeight.constant = 500
//        }
        
        return cell
    }
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        self.tableView = cell.tableView
        
        cell.textLabel!.text = String(user1.yearArray![0].monthArray![0].dayArray![0].cellArray![indexPath.row].time!)
        
        
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        
        
        //load from the data source
        
        print(user1.yearArray![(self.presentDate?.year)!].monthArray![(self.presentDate?.month)!].dayArray![(self.presentDate?.day)!].selectedArray)
        self.selectedIndexs = user1.yearArray![(self.presentDate?.year)!].monthArray![(self.presentDate?.month)!].dayArray![(self.presentDate?.day)!].selectedArray
        
        if let found = find(user1.yearArray.map({ $0.name }), ) {
            let obj = array[found]
        }
        
        
        for index in selectedIndexs!{
            if index == indexPath.row{
                cell.selected = true
            }
        }
        
        
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
//        selectedIndexs?.append(indexPath)
        updateCount(tableView)
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        lastSelectedIndex = nil
        
        updateCount(tableView)
    }
    
    
    
    func updateCount(tableView:UITableView){
        if let list = tableView.indexPathsForSelectedRows! as? [NSIndexPath] {
            print(list)
        }
    }
    
    
func onSubmitButtonPressed(sender: AnyObject) {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        
        let rows = self.tableView!.indexPathsForSelectedRows!.map{$0.row}
    
    
        //set that datasource
        user1.yearArray![(self.presentDate?.year)!].monthArray![(self.presentDate?.month)!].dayArray![(self.presentDate?.day)!].selectedArray = rows
    

}
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
