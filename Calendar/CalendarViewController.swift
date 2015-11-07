//
//  ViewController.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/2/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate , UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var collectionView: EventsCollectionView!
    
    private let sectionInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CVDate(date: NSDate()).globalDescription
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
    
    
    /// Stuck with this - want one button to toggle both ways
//    @IBAction func toWeekView(sender: AnyObject) {
//        
//        if  == MonthView{
//            calendarView.changeMode(.MonthView)
//
//        }else{
//            calendarView.changeMode(.WeekView)
//
//        }
//    }

    
    /// Switch to MonthView mode.
    @IBAction func toMonthView(sender: AnyObject) {
        calendarView.changeMode(.MonthView)
    }
    
    /// Switch to WeekView mode.
    @IBAction func toWeekView(sender: AnyObject) {
        calendarView.changeMode(.WeekView)
    }
    
    
    /// Not working as expected
    @IBAction func onTodayButtonPressed(sender: AnyObject) {
        self.viewDidLoad()
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
        let color = UIColor .redColor()
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
        return CGSize(width: 5, height: 5)
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
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
    




}
