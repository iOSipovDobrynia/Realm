//
//  CustomCell.swift
//  Realm
//
//  Created by Goodwasp on 29.09.2023.
//

import UIKit

final class TaskCell: UITableViewCell {
    
    // MARK: - Private properties
    private let taskNameLabel = UILabel()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - contentView setting
private extension TaskCell {
    func setupContentView() {
        contentView.backgroundColor = .brown
        
        addSubViews()
        
        setupLabel()
        
        setupLayout()
    }
}

// MARK: - Settings
private extension TaskCell {
    func addSubViews() {
        [
            taskNameLabel
        ].forEach { subView in
            contentView.addSubview(subView)
        }
    }
    
    func setupLabel() {
        taskNameLabel.tintColor = .black
        taskNameLabel.text = "TTEXT"
    }
}

// MARK: - Layout
private extension TaskCell {
    func setupLayout() {
        
        [
            taskNameLabel
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
            
        NSLayoutConstraint.activate([
            taskNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            taskNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
