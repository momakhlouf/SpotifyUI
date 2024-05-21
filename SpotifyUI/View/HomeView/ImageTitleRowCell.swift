//
//  ImageTitleRowCell.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 18/05/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var title: String = ""
    var imageName: String = ""
    var body: some View {
        VStack{
            ImageLoaderView(urlstring: imageName)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)

    }
}

#Preview {
    ImageTitleRowCell()
}
