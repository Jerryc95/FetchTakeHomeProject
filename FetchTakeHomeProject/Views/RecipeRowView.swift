//
//  RecipeRowView.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/7/25.
//

import SwiftUI

struct RecipeRowView: View {
    @Environment(\.colorScheme) var colorScheme
    let recipe: CacheRecipe
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(colorScheme == .dark ? Color(red: 0.2, green: 0.2, blue: 0.2) : Color.white)
                .shadow(color: .black.opacity(0.25), radius: 5)
            HStack {
                if recipe.cacheSmallImage == nil {
                    AsyncImage(url: URL(string: recipe.recipe.photoURLSmall ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        Image(systemName: "photo")
                        
                    }
                    .frame(width: 75, height: 75)
                } else {
                    Image(uiImage: recipe.cacheSmallImage!)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                VStack(alignment: .leading) {
                    Text(recipe.recipe.name)
                        .font(.title2)
                        .padding(.bottom, 5)
                    Text(recipe.recipe.cuisine)
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
                    .padding(.trailing)
               
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    RecipeRowView()
//}
