//
//  VideoPlayerView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/07/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    private var player: AVPlayer
    
    init(videoName: String, videoType: String) {
        if let path = Bundle.main.path(forResource: videoName, ofType: videoType) {
            self.player = AVPlayer(url: URL(fileURLWithPath: path))
        } else {
            self.player = AVPlayer()
        }
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player.play()
            }
            .onDisappear() {
                player.pause()
            }
    }
}
