//
//  TaskListViewController.swift
//  Realm
//
//  Created by Goodwasp on 27.09.2023.
//

import UIKit

final class TaskListViewController: UITableViewController {

    // MARK: - Private properties
    private let cellID = "task"
    private let taskList = ["List"]
    
    // MARK: - View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc
    private func addNewTask() {
        
    }
}

// MARK: - View Setting
private extension TaskListViewController {
    func setupView() {
        
        setupNavigationBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
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
            action: #selector(addNewTask)
        )
        navigationController?.navigationBar.tintColor = .black
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        
//        let task = taskList[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.text = task
//        let label = UILabel(frame: .zero)
//        label.text = "1"
//        cell.accessoryView = label
//        cell.contentConfiguration = content
//
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task

        // Создайте метку и установите ей текст
        let label = UILabel(frame: .zero)
        label.text = "1"

        // Установите метку в качестве accessoryView
        cell.accessoryView = label

        // Установите конфигурацию контента
        cell.contentConfiguration = content

        return cell
    }
}

// MARK: - UITableViewDelegate
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
