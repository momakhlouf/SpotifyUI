//
//  HomeView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    @State private var currentUser: User? = nil
    var body: some View {
        ZStack{
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView{
                LazyVStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                           spacing: nil,
                           pinnedViews: .sectionHeaders,
                           content: {
                    Section {
                        VStack(spacing: 16){
                            RecentsView()
                            if let product = viewModel.Products.first{
                             newReleaseSection(product: product)
                            }
                        }
                    } header: {
                        HeaderView()

                    }
                 
                })
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            try! await viewModel.getProducts()
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView{
    func newReleaseSection(product: Product) -> some View{
        NewReleaseView(
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
            },
            onPlayPressed: {
            }
        )
    }
}
