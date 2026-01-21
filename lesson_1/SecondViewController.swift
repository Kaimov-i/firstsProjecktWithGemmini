//
//  SecondViewController.swift
//  lesson_1
//
//  Created by Ильман on 19.01.2026.
//

import UIKit

class SecondViewController: UIViewController {

    private let friends = ["Apple", "Pyton", "ilman", "Swift", "UIKit", "Xcode", "Tim Cook"]
    
    let friendModelView = FriendsViewModel()
    
    private let loader: UIActivityIndicatorView = {
        let indecator = UIActivityIndicatorView()
        indecator.translatesAutoresizingMaskIntoConstraints = false
        indecator.hidesWhenStopped = true
        indecator.color = .black
        return indecator
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FriendCell.self, forCellReuseIdentifier: "friendCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(loader)
        setupConstraints()
        title = "Second View"
        loadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    private func loadData() {
        loader.startAnimating()
        
        Task {
            do {
               try await friendModelView.loadFriends()
                tableView.reloadData()
                loader.stopAnimating()
            } catch {
                print(error.localizedDescription)
                loader.stopAnimating()
            }
        }
        
        loader.stopAnimating()
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendModelView.numbersOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendCell else { return UITableViewCell() }
    
        let friend = friendModelView.getFriend(at: indexPath.row)

        cell.configCell(with: friend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(friends[indexPath.row])")
    }
}
