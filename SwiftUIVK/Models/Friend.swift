//
//  Friend.swift
//  SwiftUIVK
//

import Foundation

// MARK: - FriendsList
struct FriendsList: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable, Identifiable {
    let firstName: String
    let id: Int
    let lastName: String
    let photo50: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}



//class Friend: Identifiable {
//    var firstName: String
//    var lastName: String
//    var id: Int
//    var photo50: UIImage
//
//    init(firstName: String, lastName: String, id: Int, photo50: UIImage) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.id = id
//        self.photo50 = photo50
//    }
//}
