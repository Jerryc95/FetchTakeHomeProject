//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        NavigationStack {
            if recipeViewModel.recipes.isEmpty {
                Text("No Recipes Found")
                    .foregroundStyle(.gray)
                    .onAppear {
                        Task {
                            try await recipeViewModel.fetchRecipes()
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                Task {
                                    try await recipeViewModel.fetchRecipes()
                                }
                            } label: {
                                Image(systemName: "arrow.circlepath")
                            }

                        }
                    }
            } else {
                ScrollView {
                    ForEach(recipeViewModel.recipes, id: \.self) { recipe in
                        NavigationLink(value: recipe) {
                            RecipeRowView(recipe: recipe)
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .navigationDestination(for: CacheRecipe.self) { recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                }
                .navigationTitle("Recipes")
                .scrollIndicators(.hidden)
                .onAppear {
                    Task {
                        try await recipeViewModel.fetchRecipes()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            Task {
                                try await recipeViewModel.fetchRecipes()
                            }
                        } label: {
                            Image(systemName: "arrow.circlepath")
                        }

                    }
                }
            }
          
        }
    }
}

#Preview {
    ContentView()
}
