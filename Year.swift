//
//  Year.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/17/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation


class Year:NSObject {
    
    //MARK: Properties
    var isLeapYear: Bool?
    var term: Int?
    
    var monthArray:[Month]?

    
    init?(term: Int) {
        self.term = term
        if term % 4 == 0 {
            if term % 100 == 0 && term % 400 != 0 {
                self.isLeapYear = false
            }else{
                self.isLeapYear = true
            }
        }
        
            //initialize month array
            if self.isLeapYear == true{
                self.monthArray = [Month(name: "January")!,Month(name: "FebruaryLeap")!,Month(name: "March")!,Month(name: "April")!,Month(name: "May")!,Month(name: "June")!,Month(name: "August")!,Month(name: "September")!,Month(name: "October")!,Month(name: "November")!,Month(name: "December")! ]
            }else{
                self.monthArray = [Month(name: "January")!,Month(name: "February")!,Month(name: "March")!,Month(name: "April")!,Month(name: "May")!,Month(name: "June")!,Month(name: "August")!,Month(name: "September")!,Month(name: "October")!,Month(name: "November")!,Month(name: "December")! ]
            
        //Initialization should fail if there is no term
//        if term == nil {
//            return nil
//        }
    }
}

    
}

