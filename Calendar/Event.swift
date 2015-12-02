//
//  Event.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/21/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation
import Parse

class Event:PFObject, PFSubclassing {
    
    @NSManaged var startDate : NSDate
    @NSManaged var endDate : NSDate

    @NSManaged var user : User!
    
    static func parseClassName() -> String {
        return "Event"
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
}

//implement Parse
// use PFSubclassing