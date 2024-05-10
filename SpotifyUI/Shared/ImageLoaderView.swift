//
//  ImageLoaderView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI
struct ImageLoaderView: View {
    var urlstring: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlstring))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsTightening(false)
            }
            .clipped()
       
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
}
