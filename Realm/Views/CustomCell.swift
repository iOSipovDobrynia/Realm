//
//  CustomCell.swift
//  Realm
//
//  Created by Goodwasp on 29.09.2023.
//

import UIKit

final class TaskListCell: UITableViewCell {
    
    // MARK: - Private properties
    private let taskNameLabel = UILabel()
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
        taskNameLabel.text = taskList.name
        detailLabel.text = "taskList.tasks.count"
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
            taskNameLabel,
            detailLabel
        ].forEach { subView in
            contentView.addSubview(subView)
        }
    }
    
    func setupNameLabel() {
        taskNameLabel.textColor = .black
        taskNameLabel.text = "TTEXT"
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
            taskNameLabel,
            detailLabel
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
            
        NSLayoutConstraint.activate([
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
