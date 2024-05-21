//
//  FrameReader.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/05/2024.
//

import SwiftUI

struct FrameReader: View {
    let coordinateSpace: CoordinateSpace
    let onChange: (_ frame: CGRect) -> Void
    var body: some View {
        GeometryReader{ geo in
            Text("")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .onAppear(perform: {
                    onChange(geo.frame(in: coordinateSpace))
                })
                .onChange(of: geo.frame(in: coordinateSpace), perform: onChange)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

public extension View{
    func readingFrame(coordinateSpace: CoordinateSpace = .global, onChange: @escaping (_ frame: CGRect) -> Void) -> some View{
        background(FrameReader(coordinateSpace: coordinateSpace, onChange: onChange))
    }
}

//#Preview {
//    FrameReader()
//}
