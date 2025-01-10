//
//  FetchTakeHomeProjectTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jerry Cox on 1/6/25.
//

import Testing
@testable import FetchTakeHomeProject
import Foundation

struct FetchTakeHomeProjectTests {
    
    @Test func testRecipeFetch() async throws {
        let mockJSON = """
        {
          "recipes": [
            {
              "cuisine": "Malaysian",
              "name": "Apam Balik",
              "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
              "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
              "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
              "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
              "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
            },
            {
              "cuisine": "British",
              "name": "Apple & Blackberry Crumble",
              "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
              "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
              "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
              "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
              "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
            },
         ]
        }
        """
        let jsonData = mockJSON.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedRecipes = try! JSONDecoder().decode(Recipes.self, from: jsonData)
        
        #expect(decodedRecipes.recipes.count == 2)
    }
    
    @Test func testEmptyRecipeFetch() async throws {
        let mockJSON = """
         "recipes": []
        }
        """
        let jsonData = mockJSON.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedRecipes = try! JSONDecoder().decode(Recipes.self, from: jsonData)
            #expect(decodedRecipes.recipes.count == 0)
        }
    }
    
    @Test func testImageCache() async throws {
        let recipeViewModel = await RecipeViewModel()
        
        let imageURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")!
        
        #expect(await recipeViewModel.loadImage(url: imageURL, size: .large) != nil)
        
    }
    
}
