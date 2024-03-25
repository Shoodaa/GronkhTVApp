//
//  AsyncTestView.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 24.03.24.
//

import SwiftUI

struct TestAPI: Codable {
    var count: Int = 0
    var entries: [Entry] = []
    
    struct Entry: Codable {
        var API: String = ""
        var Description: String = ""
        var Auth: String = ""
        var HTTPS: Bool = true
        var Cors: String = ""
        var Link: String = ""
        var Category: String = ""
    }
}

struct AsyncTestView: View {
    @State private var test = VideoPlaylist()
    
    var body: some View {
        VStack {
            Text(String(test.playlist_url))
        }
        .task {
            test = await Bundle.main.asyncFetchAndDecode("https://api.gronkh.tv/v1/video/playlist?episode=835")
        }
    }
}

#Preview {
    AsyncTestView()
}
