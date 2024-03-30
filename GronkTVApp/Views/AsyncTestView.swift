//
//  AsyncTestView.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 24.03.24.
//

import SwiftUI

struct AsyncTestView: View {
    @State private var test = SearchResults()
    
    var body: some View {
        VStack {
            Text("N/A")
        }
        .task {
            test = await Bundle.main.asyncFetchAndDecode("https://api.gronkh.tv/v1/search?first=16&query=minecraft")
            print(test)
        }
    }
}

#Preview {
    AsyncTestView()
}
