//
//  ToDo.swift
//  ToDo
//
//  Created by student on 2017-01-26.
//  Copyright © 2017 Chris. All rights reserved.
//

import Foundation

class ToDo {
    var theTitle:String
    let dateCreated:Date
    var dateCreatedAsString:String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: self.dateCreated)
        }
    }
    var dueDate:Date!
    var theDescription:String
    var thePriority:Priority
    var priorityAsString:String {
        get {
            return self.thePriority.rawValue
        }
    }
    
    
    
    init(theTitle:String, dueDate:Date!=nil, theDescription:String="", thePriority:Priority = .Normal)
    {
        self.theTitle = theTitle
        self.dateCreated = Date()
        self.dueDate = dueDate
        self.theDescription = theDescription
        self.thePriority = thePriority
    }
}
