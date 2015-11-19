//
//  Day.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/17/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation


class Day:NSObject {
    
    //MARK: Properties
    var cellArray: [Cell]?
    var number: Int!
    var selectedArray: [Int]?
    

    
    init?(number: Int) {
        self.number = number
            //Initialization should fail if there is no term
//            if number != nil {
//                return nil
//            }
        self.cellArray = [Cell(time:"00:30")!,Cell(time:"01:00")!,
            Cell(time:"01:30")!,Cell(time:"02:00")!,Cell(time:"02:30")!,Cell(time:"03:00")!,Cell(time:"03:30")!,Cell(time:"04:00")!,Cell(time:"04:30")!,Cell(time:"05:00")!,Cell(time:"05:30")!,Cell(time:"06:00")!,Cell(time:"06:30")!,Cell(time:"07:00")!,Cell(time:"07:30")!,Cell(time:"08:00")!,Cell(time:"08:30")!,Cell(time:"09:00")!,Cell(time:"09:30")!,Cell(time:"10:00")!,Cell(time:"10:30")!,Cell(time:"11:00")!,Cell(time:"1130")!,Cell(time:"12:00")!,Cell(time:"12:30")!,Cell(time:"13:00")!,Cell(time:"13:30")!,Cell(time:"14:00")!,Cell(time:"14:30")!,Cell(time:"15:00")!,Cell(time:"15:30")!,Cell(time:"16:00")!,Cell(time:"16:30")!,Cell(time:"17:00")!,Cell(time:"17:30")!,Cell(time:"18:00")!,Cell(time:"18:30")!,Cell(time:"19:00")!,Cell(time:"19:30")!,Cell(time:"20:00")!,Cell(time:"20:30")!,Cell(time:"21:00")!,Cell(time:"21:30")!,Cell(time:"22:00")!,Cell(time:"22:30")!,Cell(time:"23:00")!,Cell(time:"23:30")!,Cell(time:"24:00")!]

    
    }
}
