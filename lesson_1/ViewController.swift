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
        setupAction()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.size.height / 3)
        ])
    }
    
    private func setupAction() {
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            let randomColor = UIColor.random()
            
            let secondVC = SecondViewController(chousenColor: randomColor)
            navigationController?.pushViewController(secondVC, animated: true)
        }
        
        customButton.addAction(action, for: .primaryActionTriggered)
    }

}

