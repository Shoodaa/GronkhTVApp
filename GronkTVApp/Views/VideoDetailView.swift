//
//  VideoDetailView.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 23.03.24.
//

import SwiftUI
import AVKit

struct VideoDetailView: View {
    @State private var videoUrl = ""
    var episode_number: Int
    var videoPlaylistURL = "https://api.gronkh.tv/v1/video/playlist?episode="
    let videoDetailURL = "https://api.gronkh.tv/v1/video/info?episode="
    @State private var videoDetails = VideoDetail()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    if videoUrl != "" {
                        MainVideoPlayer(url: videoUrl)
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity)
                                .foregroundStyle(Color("DarkPurple"))
                                .clipShape(
                                    .rect(topLeadingRadius: 0, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 0)
                                )
                            VStack(alignment: .leading) {
                                Text(videoDetails.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("White"))
                                
                                Divider()
                                
                                Text("Stream Folge \(videoDetails.episode)")
                                    .foregroundStyle(Color("White"))
                                    .padding(6)
                                    .background(Color("GreyPurple"))
                                    .clipShape(.rect(topLeadingRadius: 6, bottomLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                                
                                Text("\(videoDetails.views) Aufrufe")
                                    .foregroundStyle(Color("White"))
                                    .padding(6)
                                    .background(Color("GreyPurple"))
                                    .clipShape(.rect(topLeadingRadius: 6, bottomLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                                
                            }
                            .padding()
                        }
                        
                    } else {
                        ProgressView()
                            .task {
                                await getVideoURL()
                            }
                    }
            }
            .task {
                videoDetails = await Bundle.main.asyncFetchAndDecode("\(videoDetailURL)"+"\(String(episode_number))")
            }
            .padding()
        }
        .background(Color("DarkestPurple"))
        //.scrollBounceBehavior(.basedOnSize)
    }
        
    
    struct MainVideoPlayer: View {
        let url: String
        @State var player = AVPlayer()
        
        var body: some View {
            VideoPlayer(player: player)
                .frame(height: 300)
                .onDisappear {
                    player.pause()
                }
                .onAppear {
                    player = AVPlayer(url: URL(string: url)!)
                    //player.play()
                }
        }
    }
    
    func getVideoURL () async {
        let videoPlaylist: VideoPlaylist = await Bundle.main.asyncFetchAndDecode("\(videoPlaylistURL)"+"\(String(episode_number))")
        videoUrl = videoPlaylist.playlist_url
    }
}

#Preview {
    return VideoDetailView(episode_number: 832)
}
