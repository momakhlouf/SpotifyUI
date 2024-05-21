//
//  SongRowView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 21/05/2024.
//

import SwiftUI

struct SongRowView: View {
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 60
    var title: String = "Some song name goes hersdsdsdsddse"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 8){
            ImageLoaderView(urlstring: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .lineLimit(2)
                if let subtitle{
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.spotifyLightGray)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onCellPressed?()
                }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    SongRowView()
}
