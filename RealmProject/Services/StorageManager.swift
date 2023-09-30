//
//  StorageManager.swift
//  RealmProject
//
//  Created by Goodwasp on 29.09.2023.
//

import Foundation
import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    // MARK: - Task list
    func save(_ taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    
    func create(_ taskListName: String, completion: (TaskList) -> Void) {
        write {
            let taskList = TaskList(value: ["name": taskListName])
            realm.add(taskList)
            completion(taskList)
        }
    }
    
    func update() {

    }
    
    func delete(_ taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    // MARK: - Task
    func create(task withName: String, and note: String, to taskList: TaskList, completion: (Task) -> Void) {
        write {
            let task = Task(value: ["name": withName, "note": note])
            taskList.tasks.append(task)
            completion(task)
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
