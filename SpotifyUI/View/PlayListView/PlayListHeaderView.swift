//
//  PlayListHeaderView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 20/05/2024.
//

import SwiftUI

struct PlayListHeaderView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = Constants.randomImage
    var height: CGFloat = 300
    
    var body: some View {
        ImageLoaderView(urlstring: imageName)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 10){
                    Text(subTitle)
                        .font(.callout)
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background{
                    LinearGradient(colors: [Color.spotifyBlack.opacity(0), Color.spotifyBlack.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                }
            }
            .stretchyHeader(startingHeight: height)

    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        ScrollView{
            PlayListHeaderView()
        }
        .ignoresSafeArea()
    }
}
