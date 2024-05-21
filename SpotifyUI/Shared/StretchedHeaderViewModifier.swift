//
//  StretchedHeaderViewModifier.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 20/05/2024.
//

import SwiftUI

struct StretchedHeaderViewModifier: ViewModifier {
    var startingHeight: CGFloat = 300
    var coordinateSpace: CoordinateSpace = .global
    
    func body(content: Content) -> some View {
        GeometryReader(content: { geometry in
            content
                .frame(width: geometry.size.width, height: stretchedHeight(geometry))
                .clipped()
                .offset(y: stretchedOffset(geometry))
                
        })
        .frame(height: startingHeight)
    }
    
    private func yOffset(_ geo: GeometryProxy) -> CGFloat{
        geo.frame(in: coordinateSpace).minY
    }
    
    private func stretchedHeight(_ geo: GeometryProxy) -> CGFloat{
        let offset = yOffset(geo)
        return offset > 0 ? (startingHeight + offset) : startingHeight
    }
    
    private func stretchedOffset(_ geo: GeometryProxy) -> CGFloat{
        let offset = yOffset(geo)
        return offset > 0 ? -offset : 0
    }
}

public extension View{
    func stretchyHeader(startingHeight: CGFloat) -> some View{
        modifier(StretchedHeaderViewModifier(startingHeight: startingHeight))
    }
}

#Preview{
    ZStack{
        Color.black.ignoresSafeArea()
        
        ScrollView{
            VStack{
                Rectangle()
                    .fill(Color.red)
                    .overlay{
                        ZStack{
                            ImageLoaderView()
                        }
                    }
                    .stretchyHeader(startingHeight: 300)
            }
        }
    }
}
