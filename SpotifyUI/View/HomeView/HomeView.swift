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
                           listRows
                            
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
    NavigationStack{
        HomeView()
    }
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
    
    var listRows: some View{
        ForEach(viewModel.productRows){ row in
            VStack{
                Text(row.title)
                    .font(.title)
                    .foregroundStyle(.spotifyWhite)
                    .fontWeight(.semibold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal, 16)

                
                ScrollView(.horizontal){
                    HStack(alignment: .top , spacing: 16){
                        ForEach(row.products){ product in
                            NavigationLink {
                                PlayListView(product: product, user: User.mock)
                            } label: {
                                ImageTitleRowCell(title: product.title, imageName: product.thumbnail)

                            }

                        }
                    }
                }
            }
            
        }
    }
    
}
