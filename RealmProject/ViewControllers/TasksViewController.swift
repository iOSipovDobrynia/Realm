//
//  TasksViewController.swift
//  RealmProject
//
//  Created by Goodwasp on 30.09.2023.
//

import UIKit
import RealmSwift

final class TasksViewController: UITableViewController {
    
    // MARK: - Private properties
    private let cellID = "task"
    private var currentTasks: Results<Task>!
    private var completedTasks: Results<Task>!
    
    // MARK: - Public properties
    var taskList: TaskList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc
    private func addNewTask() {
        
    }
}

// MARK: - View settings
private extension TasksViewController {
    func setupView() {
        setupNavigationBar()
        
        currentTasks = taskList.tasks.filter("isComplete = false")
        completedTasks = taskList.tasks.filter("isComplete = true")
        addSubViews()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupLayout()
    }
}

// MARK: - Settings
private extension TasksViewController {
    func addSubViews() {
        
    }
    
    func setupNavigationBar() {
        title = taskList.name
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        navigationItem.rightBarButtonItems = [addButton, editButtonItem]
    }
}

// MARK: - Layout
private extension TasksViewController {
    func setupLayout() {
        
    }
}

// MARK: - UITableViewDataSource
extension TasksViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currentTasks.count : completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Current Tasks" : "Completed Tasks"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let task = indexPath.section == 0 ? currentTasks[indexPath.row] : completedTasks[indexPath.row]
        content.text = task.name
        content.secondaryText = task.note
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TasksViewController {
    
}

// MARK: - UIAlertController
extension TaskListViewController {
    private func showAlert(task: Task? = nil, completion: (() -> Void)? = nil) {
        let title = task != nil ? "Edit" : "Add"
        let message = "Set name for your task"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            guard let taskName = alert.textFields?.first?.text, !taskName.isEmpty else { return }
            
            guard let task = task, let completion = completion  else {
//                self?.create(task)
                return
            }
//            self?.storageManager.update(task: task, with: taskName)
            completion()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        alert.addTextField { textField in
            textField.placeholder = "Task name"
            
            guard let task = task else { return }
            textField.text = task.name
        }
        alert.addTextField { textField in
            textField.placeholder = "Task note"
            
            guard let task = task else { return }
            textField.text = task.note
        }
        
        present(alert, animated: true)
    }
}
