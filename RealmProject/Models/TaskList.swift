//
//  TaskList.swift
//  RealmProject
//
//  Created by Goodwasp on 29.09.2023.
//

import Foundation
import RealmSwift

class TaskList {
    var name = ""
    let date = Date()
    var tasks: [Task] = []
}

class Task {
    var name = ""
    var note = ""
    var isComplete = false
}
