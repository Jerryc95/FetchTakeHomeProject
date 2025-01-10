//
//  RecipeDetailView.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/7/25.
//

import SwiftUI

struct RecipeDetailView: View {
    @State private var showingYoutube = false
    @State private var showingSourceSite = false
    
    let recipe: CacheRecipe
    
    var body: some View {
        VStack {
            if recipe.cacheLargeImage == nil {
                AsyncImage(url: URL(string: recipe.recipe.photoURLLarge ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
            } else {
                Image(uiImage: recipe.cacheLargeImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            VStack {
                Text(recipe.recipe.name)
                    .font(.title)
                Text("Cuisine: \(recipe.recipe.cuisine)")
                    .font(.headline)
                
                Divider()
                Spacer()
                if recipe.recipe.sourceURL != nil {
                    Button(action: {
                        showingSourceSite = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 175, height: 60)
                            .foregroundStyle(.blue)
                            .overlay(
                                HStack(alignment: .center) {
                                    Text("Learn More")
                                        .fontWeight(.bold)
                                    
                                }
                                    .foregroundStyle(.white)
                            )
                    })
                    .padding()
                    
                }
                
                if recipe.recipe.youtubeURL != nil {
                    Button(action: {
                        showingYoutube = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 175, height: 60)
                            .foregroundStyle(.red)
                            .overlay(
                                HStack(alignment: .center) {
                                    Text("Watch Video")
                                        .fontWeight(.bold)
                                    Image(systemName: "play.fill")
                                }
                                    .foregroundStyle(.white)
                            )
                    })
                    .padding()
                }
                Spacer()
            }
            .padding(5)
            
            
            Spacer()
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showingYoutube) {
            SafariView(url: URL(string: recipe.recipe.youtubeURL!)!)
        }
        .sheet(isPresented: $showingSourceSite) {
            SafariView(url: URL(string: recipe.recipe.sourceURL!)!)
        }
    }
}

//#Preview {
//    RecipeDetailView()
//}
