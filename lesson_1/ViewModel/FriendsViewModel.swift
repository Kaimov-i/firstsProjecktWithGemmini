//
//  FriendsViewModel.swift
//  lesson_1
//
//  Created by Ильман on 22.01.2026.
//
import Foundation

class FriendsViewModel {
    
    private var friends: [Friend] = [
            Friend(name: "Apple", avatarName: "applelogo", lastSeen: .now, isOnline: true),
            Friend(name: "Ilman", avatarName: "person.circle.fill", lastSeen: .now, isOnline: false),
            Friend(name: "Swift", avatarName: "bird", lastSeen: .now, isOnline: false),
            Friend(name: "Tim Cook", avatarName: "person.fill", lastSeen: .now, isOnline: false)
        ]
    
    func numbersOfRows() -> Int {
        friends.count
    }
    
    func getFriend(at index: Int) -> Friend {
        friends[index]
    }
}
