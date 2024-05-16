//
//  NewReleaseView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/05/2024.
//

import SwiftUI

struct NewReleaseView: View {
    
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPlaylistPressed:(() -> Void)? = nil
    var onPlayPressed:(() -> Void)? = nil

    var body: some View {
        VStack{
            HStack{
                ImageLoaderView()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    if let headline{
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    if let subheadline{
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack{
                ImageLoaderView()
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 35){
                    VStack(alignment: .leading, spacing: 2){
                        if let title{
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle{
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .foregroundStyle(.spotifyLightGray)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x:-4)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundStyle(.spotifyWhite)
                           
                    }
                    .padding(.trailing)
                }
            }
            .background(Color.spotifyDarkGray)
            .cornerRadius(9)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    NewReleaseView()
        .padding()
}
