//
//  NetworkModel .swift
//  Characters
//
//  Created by Евгений Таракин on 10.01.2025.
//

import Foundation

// MARK: - NetworkModel

struct NetworkModel: Codable {
    let info: Info?
    let results: [Character]?
}

// MARK: - Info

struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result

struct Character: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location

struct Location: Codable {
    let name: String?
    let url: String?
}
