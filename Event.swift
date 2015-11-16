//
//  Event.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/11/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation


class Event:NSObject {
    
    //MARK: Properties
    var date: String?
    var startTime: String?
    var EndTime: String?
    var blocks: Int?

    
    
    
//    //MARK: Initialization
//    
//    init?(date: String, startTime: String, blocks: Int) {
//        self.date = date
//        self.startTime = startTime
//        self.blocks = blocks
//        
//        
//        //Initialization should fail if there is no startTime, no date, or if the hours is negative
//        if date.isEmpty || startTime.isEmpty || blocks < 0 {
//            return nil
//        }
//        
//    }

}