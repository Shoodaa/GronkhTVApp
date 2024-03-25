//
//  ContentView.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 21.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var discovery = Discovery()
    
    var body: some View {
        TabView {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(discovery.discovery) { video in
                            NavigationLink {
                                VideoDetailView(episode_number: video.episode)
                            } label: {
                                VideoComponent(singleVideo: video)
                            }
                        }
                    }
                }
                .background(Color("DarkestPurple"))
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Text("Videothek")
                .tabItem {
                    Image(systemName: "play")
                    Text("Videothek")
                }
            Text("Suche")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Suche")
                }
        }
        .task {
            discovery = await Bundle.main.asyncFetchAndDecode("https://api.gronkh.tv/v1/video/discovery/recent")
        }
    }
}

#Preview {
    ContentView()
}
