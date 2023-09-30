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
        try! realm.write {
            realm.add(taskLists)
        }
    }
    
    func create() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    // MARK: - Task
}
