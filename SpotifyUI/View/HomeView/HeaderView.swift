//
//  HeaderView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import SwiftUI

struct HeaderView: View {
    @State private var selectedCategory: Category? = nil
    var body: some View {
        
        
        HStack(spacing: 0){
            ZStack{
                ImageLoaderView()
                    .clipShape(Circle())
                    .onTapGesture {
                        //to profile
                    }
            }
            .frame(width: 30, height: 30)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(Category.allCases, id: \.self){ category in
                        CategoryCell(title: category.rawValue.capitalized, isSelected: selectedCategory == category)

                            .onTapGesture {
                                selectedCategory = category
                            }
                        
                        
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 3)
        .padding(.vertical, 20)
        .background(.spotifyBlack)
    }
}

#Preview {
    HeaderView()
}
