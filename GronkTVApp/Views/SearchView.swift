//
//  SearchView.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 30.03.24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let searchAPI = "https://api.gronkh.tv/v1/search?first=16&"
    @State private var searchResults = SearchResults()
    
    var body: some View {
        NavigationStack {
            if !searchText.isEmpty {
                List {
                    if let video = searchResults.results?.videos {
                        ForEach(video) { single in
                            NavigationLink {
                                VideoDetailView(episode_number: single.episode)
                            } label: {
                                VideoComponent(singleVideo: single)
                            }
                            //VideoComponent(singleVideo: $0)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            Task {
                searchResults = await Bundle.main.asyncFetchAndDecode(searchAPI + "query=\(searchText)")
            }
        }
    }
}

#Preview {
    SearchView()
}
