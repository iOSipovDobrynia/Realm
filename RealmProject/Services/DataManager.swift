//
//  DataManager.swift
//  RealmProject
//
//  Created by Goodwasp on 30.09.2023.
//

import Foundation

final class DataManager {
    
    static let shared = DataManager()
    
    // MARK: - Initialization
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        // shopping list
        let shoppingList = TaskList()
        shoppingList.name = "Shopping List"
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "1.5l"
        
        let butter = Task(value: ["Butter", "2 pack", true])
        let pears = Task(value: ["name": "Pears", "isComplete": true])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [butter, pears], at: 0)
        
        // tv series list
        let tvList = TaskList()
        tvList.name = "TV Series List"
        
        let got = Task()
        got.name = "Game of Thrones"
        
        let aot = Task()
        aot.name = "Attack on Titan"
        aot.note = "04.11.2023"
        
        tvList.tasks.insert(contentsOf: [got, aot], at: 0)
        
        DispatchQueue.main.async {
            StorageManager.shared.save([shoppingList, tvList])
            completion()
        }
    }
}
