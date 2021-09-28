//
//  ProductItem.swift
//  Bucket
//
//  Created by Dimil T Mohan on 2021/09/27.
//

import Foundation

struct ProductItem: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeWrapper(key: .id, defaultValue: "")
        self.title = try container.decodeWrapper(key: .title, defaultValue: nil)
        self.price = try container.decodeWrapper(key: .price, defaultValue: "")
        self.details = try container.decodeWrapper(key: .description, defaultValue: nil)
        self.url = try container.decodeWrapper(key: .imageURL, defaultValue: "")
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode (id, forKey: .id)
        try container.encode (title, forKey: .title)
        try container.encode (price, forKey: .price)
        try container.encode (details, forKey: .description)
        try container.encode (url, forKey: .imageURL)
    }
    
    let id: String!
    let title: String?
    let price: String?
    let details: String?
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case price
        case description
        case imageURL = "image"
    }
}
