//
//  User.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation

struct Profile: Codable {
    let email: String
    let password: String
    let name: String?
    let savedRecipes: [Recipe]?
    let uploadedRecipes: [Recipe]?
    let favouriteIngredients: [Ingredient]?
    let favouriteCategories: [Category]?
    let reviews: [Review]?
}
