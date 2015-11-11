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
        
        
        let submit = UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: "onSubmitButtonPressed")
        submit.tintColor = UIColor.redColor()
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRectMake(0, self.view.frame.size.height - 46, self.view.frame.size.width, 46)
        toolbar.sizeToFit()
        toolbar.setItems([submit], animated: true)
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
        return CGSize(width: collectionView.frame.width,height: collectionView.frame.height)//CGSize(width: UIScreen.mainScreen().bounds.width, height: 360)
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
        return cell
    }
    




}
