//
//  TasksViewController.swift
//  Realm
//
//  Created by Goodwasp on 30.09.2023.
//

import UIKit

final class TasksViewController: UITableViewController {
    
    // MARK: - Private properties
    private let cellID = "task"
    
    // MARK: - Public properties
    var taskList: TaskList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - View settings
private extension TasksViewController {
    func setupView() {
        tableView.register(TaskListCell.self, forCellReuseIdentifier: cellID)
    }
}

// MARK: - UITableViewDataSource
extension TasksViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TasksViewController {
    
}
