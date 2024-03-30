//
//  RecentVideos.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 23.03.24.
//

import Foundation

struct Discovery: Codable {
    var discovery: [RecentVideos] = []
}

struct RecentVideos: Codable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var season: Int?
    var episode: Int = 0
    var created_at: String = ""
    var video_length: Int = 0
    var views: Int = 0
    var preview_url: String = ""
    var tags: [String] = []
    
    var formatted_length: String {
        return "\(video_length / 3600):\((video_length % 3600) / 60):\((video_length % 3600) % 60)"
    }
}
