//
//  searchResults.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 30.03.24.
//

import Foundation

struct SearchResults: Codable {
    var results: singleResult?
    
    struct singleResult: Codable {
        var videos: [RecentVideos]?
    }
}
