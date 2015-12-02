//
//  Event.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/21/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation


public class Event:NSObject {
    
    var index: Int?
    
    init?(index: Int) {
        self.index = index
    }

}