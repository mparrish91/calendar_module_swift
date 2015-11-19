//
//  Cell.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/17/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation


class Cell:NSObject {
    
    //MARK: Properties
    var time: String?
    var isSelected:Bool?
    
    init?(time: String) {
        self.time = time
        }
    
}