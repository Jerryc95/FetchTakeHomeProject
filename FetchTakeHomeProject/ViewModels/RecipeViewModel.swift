//
//  RecipeViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/6/25.
//

/*
 Designing using the ObserableObject protocol as the @Observable macro is iOS 17+
 */

import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [CacheRecipe] = []
    
    private let imageCache = ImageCache.shared
    
    private let url = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    
    func fetchRecipes() async throws {
        let url = URL(string: url)!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            let error = URLError(.badURL)
            throw error
        }
        
        let decoder = JSONDecoder()
        
        if httpResponse.statusCode == 200 {
            let decodedRecipes = try decoder.decode(Recipes.self, from: data)
            for decodedRecipe in decodedRecipes.recipes {
                var smallImage: UIImage?
                var largeImage: UIImage?
                if let smallImageURL = decodedRecipe.photoURLSmall {
                    smallImage = await loadImage(url: URL(string: smallImageURL)!, size: .small)
                }
                if let largeImageURL = decodedRecipe.photoURLLarge {
                    largeImage = await loadImage(url: URL(string: largeImageURL)!, size: .large)
                }
               let cachedRecipe = CacheRecipe(recipe: decodedRecipe, cacheSmallImage: smallImage, cacheLargeImage: largeImage)
                if !self.recipes.contains(where: {$0.recipe.id == decodedRecipe.id}) {
                    self.recipes.append(cachedRecipe)
                }
              
            }

        } else {
            let error = URLError(.badURL)
            throw error
        }
    
    }
    
    func loadImage(url: URL, size: imageSize) async -> UIImage? {
        let key = url.absoluteString

        if let cacheImage = imageCache.getImage(from: key) {
            return cacheImage
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                imageCache.setImage(image: image, for: key)
                return image
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    enum imageSize {
        case small
        case large
    }
}
