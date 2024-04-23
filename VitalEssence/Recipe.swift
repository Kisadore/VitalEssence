//
//  Recipe.swift
//  VitalEssence
//
//  Created by Kiahna Isadore on 4/22/24.
//

import Foundation

struct RecipeResponse: Decodable {
    let meals: [Recipe]
}
struct Recipe: Decodable{
    let strMeal: String
    let idMeal: String
    let strMealThumb: String?
    
}
