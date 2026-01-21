//
//  FriendCell.swift
//  lesson_1
//
//  Created by Ильман on 21.01.2026.
//

import UIKit

class FriendCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dateText: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 16, weight: .medium)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateText)
        
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
    }
    
    func configCell(with friend: Friend) {
        nameLabel.text = friend.name
        avatarImageView.image = UIImage(systemName: friend.avatarName)
        dateText.text = friend.lastSeen.formatted(date: .omitted, time: .shortened)
        let textColor = friend.isOnline ? UIColor.green: UIColor.label
        nameLabel.textColor = textColor
    }
}
