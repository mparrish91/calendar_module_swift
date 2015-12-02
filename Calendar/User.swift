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
    
}


