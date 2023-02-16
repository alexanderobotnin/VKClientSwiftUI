//
//  Group.swift
//  SwiftUIVK
//


import Foundation
import UIKit

import Foundation

// MARK: - GroupsList
struct GroupsList: Codable {
    let response: GroupsResponse
}

// MARK: - Response
struct GroupsResponse: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable, Identifiable {
    let id: Int
    let name: String
    let screenName: String
    let photo50: String
    let itemDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case photo50 = "photo_50"
        case itemDescription = "description"
    }
}

//class Group: Identifiable {
//    var groupName: String
//    var groupDescription: String
//    var groupIcon: UIImage
//
//    init(groupName: String, groupDescription: String, groupIcon: UIImage) {
//        self.groupName = groupName
//        self.groupDescription = groupDescription
//        self.groupIcon = groupIcon
//    }
//}
