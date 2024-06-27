//
//  Review.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation

struct Review: Codable {
    let rating: Int
    let comment: String?
    let createdBy: Profile
}
