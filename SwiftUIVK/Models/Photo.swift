//
//  Photo.swift
//  SwiftUIVK
//

import Foundation

// MARK: - PhotosCollection
struct PhotosCollection: Codable {
    let response: PhotosResponse
}

// MARK: - Response
struct PhotosResponse: Codable {
    let count: Int
    let items: [PhotoItem]
}

// MARK: - Item
struct PhotoItem: Codable {
    let date: Int
    let urls: [Photo]

    enum CodingKeys: String, CodingKey {
        case date
        case urls = "sizes"
    }
}

// MARK: - Size
struct Photo: Codable {
    let url: String
}
