//
//  ViewController.swift
//  lesson_1
//
//  Created by Ильман on 17.01.2026.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var customButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.image = UIImage(systemName: "paintpalette")
        config.imagePlacement = .leading
        config.imagePadding = 10
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(customButton)
        setupConstraints()
      
        let action = UIAction { [weak self] _ in
            UIView.animate(withDuration: 0.3) {
                
                self?.view.backgroundColor = UIColor.random()
            }
        }
        customButton.addAction(action, for: .primaryActionTriggered)
     
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.size.height / 3)
        ])
    }

}

