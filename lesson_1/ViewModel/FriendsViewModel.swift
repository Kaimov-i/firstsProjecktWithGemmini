//
//  FriendsViewModel.swift
//  lesson_1
//
//  Created by Ильман on 22.01.2026.
//
import Foundation

@MainActor
class FriendsViewModel {
    
    private var friends: [Friend] = []
    
    func loadFriends() async throws {
        let networkManager = NetworkManager.shared
        guard let friendsData = try? await networkManager.fetchFriends() else { return }
        
        self.friends = friendsData
    }
    
    
    
    func numbersOfRows() -> Int {
        friends.count
    }
    
    func getFriend(at index: Int) -> Friend {
        friends[index]
    }
    
    func removeFriend(at index: Int) {
        friends.remove(at: index)
    }
}
