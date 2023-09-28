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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let task = taskList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = task
        cell.accessoryType = .checkmark
        
        // first create UIImageView
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit

        // then set it as cellAccessoryType
        cell.accessoryView = imageView
        
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
