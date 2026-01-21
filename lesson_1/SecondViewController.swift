//
//  SecondViewController.swift
//  lesson_1
//
//  Created by Ильман on 19.01.2026.
//

import UIKit

class SecondViewController: UIViewController {
    
    let backgroundColor: UIColor
    private let friends = ["Apple", "Swift", "UIKit", "Xcode", "Tim Cook"]
    
    let backButton: UIButton = {
        var button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Back"
        config.cornerStyle = .medium
        config.titlePadding = 20
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(chousenColor: UIColor) {
        self.backgroundColor = chousenColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backButton)
        setupConstraints()
        buttonTap()
        view.backgroundColor = backgroundColor
        title = "Second View"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func buttonTap() {
        let action = UIAction { [weak self ] _ in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }
        
        backButton.addAction(action, for: .touchUpInside)
    }
    
}
