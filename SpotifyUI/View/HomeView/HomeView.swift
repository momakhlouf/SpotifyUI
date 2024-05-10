//
//  HomeView.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var currentUser: User? = nil
    var body: some View {
        ZStack{
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView{
                LazyVStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, pinnedViews: .sectionHeaders, content: {
                    Section {
                        RecentsView()
                    } header: {
                        HeaderView()

                    }
                 
                })
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
    }
}

#Preview {
    HomeView()
}
