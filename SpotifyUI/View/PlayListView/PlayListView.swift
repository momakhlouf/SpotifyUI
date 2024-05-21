//
//  PlayListView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 20/05/2024.
//

import SwiftUI

struct PlayListView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showHeader: Bool = false
    var product: Product
    var user: User
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView{
                LazyVStack(spacing: 15){
                    
                    PlayListHeaderView(title: product.title, subTitle: product.brand, imageName: product.thumbnail, height: 300)
                        .readingFrame { frame in
                            showHeader = frame.maxY < 150
                        }
                    
                    
                    PlayListDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subHeadline: product.category,
                        onAddPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal ,16)
                    
                    ForEach(viewModel.Products){ product in
                        SongRowView(imageName: product.thumbnail, imageSize: 50, title: product.title, subtitle: product.category) {
                            
                        } onEllipsisPressed: {
                            
                        }
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            ZStack{
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.spotifyBlack)
                    .offset(y: showHeader ? 0 : -200)
                    .opacity(showHeader ? 1: 0)
                
                
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding(8)
                    .background(
                        showHeader ? Color.black.opacity(0.001) :  Color.spotifyGray.opacity(0.7)
                    )
                    .clipShape(Circle())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading, 12)
                    .onTapGesture {
                        dismiss()
                    }
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.4), value: showHeader)
            
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        }
        .task {
            try! await viewModel.getProducts()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    PlayListView(product: .mock, user: .mock)
}
