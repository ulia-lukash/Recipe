//
//  Recipe.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation

struct Recipe: Codable {
    let title: String
    let description: String?
    let instructions: [String]
    let ingredients: [String : Ingredient]?
    let imagesUrls: [URL]?
    let videoUrl: URL?
    let reviews: [Review]
    let tags: [String]
//    let categories...?
}
