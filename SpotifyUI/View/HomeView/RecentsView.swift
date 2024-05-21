//
//  RecentsView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import SwiftUI

struct RecentsView: View {
    @StateObject var viewModel = ViewModel()
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 10), count: 4)
    
    var body: some View {
        
        ScrollView(.horizontal){
            LazyHGrid(rows: rows, spacing: 10){
                ForEach(viewModel.Products){ product in
                    NavigationLink {
                        PlayListView(product: product, user: User.mock)
                    } label: {
                        recentsCell(product: product)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .task {
            try! await viewModel.getProducts()
        }
        
    }
}

#Preview {
    RecentsView()
}

extension RecentsView{
    
    func recentsCell(product: Product) -> some View{
        HStack{
            ImageLoaderView(urlstring: product.thumbnail)
                .frame(width: 60, height: 60)
            
            Text(product.title)
                .foregroundStyle(.spotifyWhite)
                .fontWeight(.semibold)
                .lineLimit(2)
            //  Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
        .background(.spotifyDarkGray)
        .cornerRadius(10)
    }
    
}



