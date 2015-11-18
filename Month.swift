//
//  Month.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/17/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import Foundation

class Month:NSObject {
    
    //MARK: Properties
    var dayArray = []
    var name: String?
    

    init?(name: String) {
        self.name = name
        if name == "January"
        {
            self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
        }
        if name == "February"
        {
            self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28)]
        }
        
        if name == "FebruaryLeap"
        {
            self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29)]
        }
        
        if name == "March"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
        }
        if name == "April"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30)]
            }
        if name == "May"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
            }
        if name == "June"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30)]
            }
        if name == "July"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
            }
        if name == "August"{
            
                self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
            }
        if name == "September"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30)]
            }
        if name == "October"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
            }
        if name == "November"{
                        self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30)]
            }
        if name == "December"{
                            self.dayArray = [Day(number: 1),Day(number: 2),Day(number: 3),Day(number: 4),Day(number: 5),Day(number: 7),Day(number: 8),Day(number: 9),Day(number: 10),Day(number: 11),Day(number: 12),Day(number: 13),Day(number: 14),Day(number: 15),Day(number: 16),Day(number: 17),Day(number: 18),Day(number: 19),Day(number: 20),Day(number: 21),Day(number: 22),Day(number: 23),Day(number: 24),Day(number: 25),Day(number: 26),Day(number: 27),Day(number: 28),Day(number: 29),Day(number: 30),Day(number: 31)]
            }
            
//            //Initialization should fail if it does not match a proper month
//            if  !["January","February", "March", "April",  "May",  "June",  "July",  "August",  "September",  "October",  "November",  "December"].contains(name) {
//                return nil
//        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}