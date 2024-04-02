//
//  VideoDetail.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 23.03.24.
//

import Foundation

struct VideoDetail: Codable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var created_at: String = ""
    var season: Int = 0
    var episode: Int = 0
    var source_fps: Int = 0
    var source_length: Int = 0
    var source_width: Int = 0
    var source_height: Int = 0
    var views: Int = 0
    var preview_url: String = ""
    var vtt_url: String = ""
    var sprite_url: String = ""
    var tags: [String]?
    var chat_replay: String?
    var widgets: [String]?
    var chapters: [Chapter]?
    var next: Next?
    var previous: Previous?

    var formatted_length: String {
        return "\(source_length / 3600):\((source_length % 3600) / 60):\((source_length % 3600) % 60)"
    }
}

struct Chapter: Codable {
    var id: Int = 0
    var title: String = ""
    var offset: Int = 0
    var game: Game?
}

struct Game: Codable {
    var id: Int = 0
    var title: String = ""
    var twitch_details: TwitchDetails?
}

struct TwitchDetails: Codable {
    var id: String = ""
    var title: String = ""
    var thumbnail_url: String = ""
}

struct Previous: Codable {
    var id: Int = 0
    var title: String = ""
    var created_at: String = ""
    var season: Int = 0
    var episode: Int = 0
    var views: Int = 0
    var video_length: Int = 0
    var preview_url: String = ""
}

struct Next: Codable {
    var id: Int = 0
    var title: String = ""
    var created_at: String = ""
    var season: Int = 0
    var episode: Int = 0
    var views: Int = 0
    var video_length: Int = 0
    var preview_url: String = ""
}
