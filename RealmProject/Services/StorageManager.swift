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
    
    func create(_ taskList: String, completion: (TaskList) -> Void) {
        write {
            let taskList = TaskList(value: ["name": taskList])
            realm.add(taskList)
            completion(taskList)
        }
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    // MARK: - Task
    
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
