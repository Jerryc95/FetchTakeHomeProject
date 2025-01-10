//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/6/25.
//

import SwiftUI

struct Recipe: Codable, Hashable, Identifiable {
    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let id: String
    let sourceURL: String?
    let youtubeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case id = "uuid"
        case youtubeURL = "youtube_url"
       }
}

struct Recipes: Codable {
    var recipes: [Recipe] = []
}

struct CacheRecipe: Hashable {
    let recipe: Recipe
    var cacheSmallImage: UIImage?
    var cacheLargeImage: UIImage?
}
