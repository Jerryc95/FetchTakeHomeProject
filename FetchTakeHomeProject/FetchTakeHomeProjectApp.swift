//
//  FetchTakeHomeProjectApp.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/6/25.
//

import SwiftUI

@main
struct FetchTakeHomeProjectApp: App {
    @StateObject var recipeViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
    }
}
