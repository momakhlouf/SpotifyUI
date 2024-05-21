//
//  PlayListDescriptionCell.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 20/05/2024.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    var descriptionText: String = Product.mock.description
    var userName: String = "Mohamed"
    var subHeadline: String = "Some SubHeadlines"
    var iconName: String = "apple.logo"
    var onAddPressed: (()-> Void)? = nil
    var onDownloadPressed: (()-> Void)? = nil
    var onSharePressed: (()-> Void)? = nil
    var onEllipsisPressed: (()-> Void)? = nil
    var onShufflePressed: (()-> Void)? = nil
    var onPlayPressed: (()-> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(descriptionText)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundStyle(.spotifyLightGray)
            
            madeForYouSection
            
            Text(subHeadline)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
         
            buttonsRow
        }
    }
}

#Preview {
    PlayListDescriptionCell()
}


extension PlayListDescriptionCell{
    var madeForYouSection: some View{
        HStack{
            Image(systemName: iconName)
                .resizable()
                .frame(width: 22, height: 24)
                .foregroundStyle(Color.spotifyGreen)
            Text("Made for ")
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
            +
            Text(userName)
                .fontWeight(.semibold)
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    var buttonsRow: some View{
        HStack{
            HStack(spacing: 8){
                CustomButton(size: 20, iconColor: .spotifyLightGray, imageName: "plus.circle")
                    .onTapGesture {
                    }
                CustomButton(size: 20, iconColor: .spotifyLightGray, imageName: "arrow.down.circle")
                    .onTapGesture {
                    }
                CustomButton(size: 20, iconColor: .spotifyLightGray, imageName: "square.and.arrow.up")
                    .onTapGesture {
                    }
                CustomButton(size: 20, iconColor: .spotifyLightGray, imageName: "ellipsis")
                    .onTapGesture {
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack{
                CustomButton(size: 30, iconColor: .spotifyGreen, imageName: "shuffle")
                    .onTapGesture {
                    }
                CustomButton(size: 30, iconColor: .spotifyGreen, imageName: "play.circle.fill")
                    .onTapGesture {
                    }
            }
        }
    }
}





struct CustomButton: View {
    var size: CGFloat = 30
    var iconColor: Color = .spotifyLightGray
    var imageName: String = "plus"
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .fontWeight(.semibold)
            .foregroundStyle(iconColor)
            .frame(width: size, height: size)
            .padding(8)
            .background(Color.black.opacity(0.001))
            
    }
}
