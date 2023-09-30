//
//  TaskList.swift
//  RealmProject
//
//  Created by Goodwasp on 29.09.2023.
//

import Foundation
import RealmSwift

class TaskList: Object {
    @Persisted var name = ""
    @Persisted var date = Date()
    @Persisted var tasks = List<Task>()
}

class Task: Object {
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var isComplete = false
}
