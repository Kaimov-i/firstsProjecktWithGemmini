//
//  NetworkManager.swift
//  lesson_1
//
//  Created by Ильман on 22.01.2026.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let friends = [
        Friend(name: "Apple", avatarName: "applelogo", lastSeen: .now, isOnline: true),
        Friend(name: "Ilman", avatarName: "person.circle.fill", lastSeen: .now, isOnline: false),
        Friend(name: "Swift", avatarName: "bird", lastSeen: .now, isOnline: false),
        Friend(name: "Tim Cook", avatarName: "person.fill", lastSeen: .now, isOnline: false)
    ]
    
    
    func fetchFriends() async throws -> [Friend] {
        var dataF = try JSONEncoder().encode(friends)
        try await Task.sleep(for: .seconds(2))
        let friends = try JSONDecoder().decode([Friend].self, from: dataF)
        return friends
    }
}
