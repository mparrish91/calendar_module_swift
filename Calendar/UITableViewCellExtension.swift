//
//  UITableViewCellExtension.swift
//  Calendar
//
//  Created by Malcolm Parrish on 11/18/15.
//  Copyright © 2015 WordWise. All rights reserved.
//

import UIKit

extension UITableViewCell{
    var tableView:UITableView?{
        get{
            var table:UIView? = superview
            while !(table is UITableView) && table != nil{
                table = table?.superview
            }
            return table as? UITableView
        }
    }
}