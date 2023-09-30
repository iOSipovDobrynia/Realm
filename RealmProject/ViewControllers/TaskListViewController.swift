//
//  TaskListViewController.swift
//  RealmProject
//
//  Created by Goodwasp on 27.09.2023.
//

import UIKit

final class TaskListViewController: UITableViewController {

    // MARK: - Private properties
    private let cellID = "taskList"
    private let taskLists: [TaskList] = []
    private let storageManager = StorageManager.shared
    
    // MARK: - View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc
    private func addNewTaskList() {
        showAlert()
    }
    
    private func showTasks() {
        let tasksVC = TasksViewController()
        
        present(tasksVC, animated: true)
    }
}

// MARK: - View Setting
private extension TaskListViewController {
    func setupView() {
        
        setupNavigationBar()
        
        tableView.register(TaskListCell.self, forCellReuseIdentifier: cellID)
        
        setupLayout()
    }
}

// MARK: - Settings
private extension TaskListViewController {
    func setupNavigationBar() {
        title = "Task list"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTaskList)
        )
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

// MARK: - Layout
private extension TaskListViewController {
    func setupLayout() {
        
    }
}

// MARK: - UITableViewDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let cell = cell as? TaskListCell else { return UITableViewCell() }
        let taskList = taskLists[indexPath.row]
        
        cell.configure(with: taskList)
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showTasks()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let taskList = taskLists[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] _, _, isDone in
            self?.showAlert(taskList: taskList, completion: {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
            isDone(true)
        }
        let doneAction = UIContextualAction(style: .normal, title: "Done") { _, _, isDone in
            tableView.reloadRows(at: [indexPath], with: .automatic)
            isDone(true)
        }
        
        editAction.backgroundColor = .orange
        doneAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [doneAction, editAction, deleteAction])
    }
}

// MARK: - UIAlertController
extension TaskListViewController {
    private func showAlert(taskList: TaskList? = nil, completion: (() -> Void)? = nil) {
        let title = taskList != nil ? "Edit" : "Add"
        let message = "Set name for your task list"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            guard let taskListName = alert.textFields?.first?.text, !taskListName.isEmpty else { return }
            
            guard let taskList = taskList, let completion = completion  else {
//                self?.create(taskListName)
                return
            }
//            self?.storageManager.update(taskList: taskList, with: taskListName)
            completion()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        alert.addTextField { textField in
            textField.placeholder = "Task list name"
            
            guard let taskList = taskList else { return }
            textField.text = taskList.name
        }
        
        present(alert, animated: true)
    }
}