//
//  User.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/14/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation
import Parse


class User:PFUser {
    
    //MARK: Properties
    @NSManaged var name: String
    
    var events : [Event]!
    
    func refreshEvents() {
        //use a PFQuery
        let query = Event.query()!
        query.whereKey("user", equalTo: self)
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                self.events = objects as! [Event]
            NSNotificationCenter.defaultCenter().postNotificationName("eventsUpdated", object: nil)
            }
        }
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    func eventsForDay(date: NSDate) -> [Event] {
//        var daysEvents : [Event] = []
//        for event in self.events {
//            if event.startDate.compare(date) == .OrderedDescending && event.startDate.compare(date.dateByAddingTimeInterval(86400)) == .OrderedAscending {
//                daysEvents.append(event)
//            }
//        }
//        return daysEvents
        
        return self.events.filter({$0.startDate.compare(date) == .OrderedDescending && $0.startDate.compare(date.dateByAddingTimeInterval(86400)) == .OrderedAscending})
    }
    
    
    class func getDatesWithTimeForRow(index: NSIndexPath, date: NSDate) -> NSDate {
        
        let timesArray = [[0,00],[0,30],[01,00],[01,30],[02,00],[02,30],[03,00],[03,30],[04,00],[04,30],[05,00],[05,30],[06,00],[06,30],[07,00],[07,30],[08,00],[08,30],[09,00],[09,30],[10,00],[10,30],[11,00],[11,30],[12,00],[12,30],[13,00],[13,30],[14,00],[14,30],[15,00],[15,30],[16,00],[16,30],[17,00],[17,30],[18,00],[18,30],[19,00],[19,30],[20,00],[20,30],[21,00],[21,30],[22,00],[22,30],[23,00],[23,30]]

        let time = timesArray[index.row]
    
        let cal: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        let newDate = cal.dateBySettingHour(time[0], minute: time[1], second: 0, ofDate: date, options: NSCalendarOptions())!
        
        return newDate
    }
    
//    isthereaneventatthistime method
    class func isCellWithinEvent(cellDate:NSDate, startTime:NSDate, endTime:NSDate) -> Bool {
        
        if cellDate.earlierDate(endTime) == cellDate && cellDate.laterDate(startTime) == cellDate{
            return true
        }
            return false
        
    }


    
}

//    ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]

