//
//  VideoComponent.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 23.03.24.
//

import SwiftUI

struct VideoComponent: View {
    var singleVideo: RecentVideos
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                AsyncImage(url: URL(string: singleVideo.preview_url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 16,
                                    topTrailingRadius: 16
                                )
                            )
                    } else if phase.error != nil {
                        Text("There was an error loading the image")
                    } else {
                        ProgressView()
                    }
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 120, height: 40)
                        .background(Color("GreyPurple"))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 8,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 8
                            )
                        )
                        .foregroundStyle(Color("DarkestPurple"))
                        .opacity(0.5)
                    HStack {
                        Text("🕔")
                        Text(String(singleVideo.formatted_length))
                            .foregroundStyle(Color("White"))
                    }
                }
                .offset(x: -110, y: 80)
                
                ZStack {
                    Rectangle()
                        .frame(width: 60, height: 40)
                        .background(Color("GreyPurple"))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 8,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 8
                            )
                        )
                        .foregroundStyle(Color("DarkestPurple"))
                        .opacity(0.5)
                    HStack {
                        Text("#" + String(singleVideo.episode))
                            .foregroundStyle(Color("White"))
                    }
                }
                .offset(x: 140, y: 80)
            }
            ZStack {
                Rectangle()
                    .clipShape(
                        .rect(
                            bottomLeadingRadius: 16,
                            bottomTrailingRadius: 16
                        )
                    )
                    .frame(width: .infinity, height: 150)
                    .foregroundStyle(Color("GreyPurple"))
                Text(singleVideo.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    
    struct AsyncTestView: View {
        @State var passedValue = Discovery()
        @State var oneVideo = RecentVideos()
        
        var body: some View {
            VideoComponent(singleVideo: oneVideo)
                .task {
                    passedValue = await Bundle.main.asyncFetchAndDecode("https://api.gronkh.tv/v1/video/discovery/recent")
                    oneVideo = passedValue.discovery[0]
                }
        }
    }
    
    return AsyncTestView()
}
