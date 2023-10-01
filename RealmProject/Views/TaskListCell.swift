//
//  TaskListCell.swift
//  RealmProject
//
//  Created by Goodwasp on 29.09.2023.
//

import UIKit

final class TaskListCell: UITableViewCell {
    
    // MARK: - Private properties
    private let taskListNameLabel = UILabel()
    private let detailLabel = UILabel()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    func configure(with taskList: TaskList) {
        taskListNameLabel.text = taskList.name
        
        let currentTasks = taskList.tasks.filter("isComplete = false")
        detailLabel.text = "\(currentTasks.count)"
    }
}

// MARK: - contentView setting
private extension TaskListCell {
    func setupContentView() {        
        addSubViews()
        
        setupNameLabel()
        setupDetailLabel()
        
        setupLayout()
    }
}

// MARK: - Settings
private extension TaskListCell {
    func addSubViews() {
        [
            taskListNameLabel,
            detailLabel
        ].forEach { subView in
            contentView.addSubview(subView)
        }
    }
    
    func setupNameLabel() {
        taskListNameLabel.textColor = .black
        taskListNameLabel.text = "TTEXT"
    }
    
    func setupDetailLabel() {
        detailLabel.textColor = .gray
        detailLabel.text = "Detail"
    }
}

// MARK: - Layout
private extension TaskListCell {
    func setupLayout() {
        [
            taskListNameLabel,
            detailLabel
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
            
        NSLayoutConstraint.activate([
            taskListNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskListNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
