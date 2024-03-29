//
//  PlayerView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 23/03/2024.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    @State private var isEditing: Bool = false
    
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                }
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()

                if let player = audioManager.player {
                        VStack(spacing: 5) {
                            Slider(value: $value, in: 0...player.duration) { editing in
                                print("editing", editing)
                                isEditing = editing
                                if !editing {
                                    player.currentTime = value
                                }
                            }
                            .accentColor(.white)
                            
                            HStack {
                                Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                                Spacer()
                                Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                            }
                            .font(.caption)
                            .foregroundColor(.white)
                        }
                        
                        HStack {
                            let color: Color = audioManager.isLooping ? .teal : .white
                            PlayBackControlButton(systemName: "repeat", color: color) {
                                audioManager.toggleLoop()
                            }
                            Spacer()
                            
                            PlayBackControlButton(systemName: "gobackward.10") {
                                player.currentTime -= 10
                            }
                            Spacer()
                            
                            PlayBackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                                audioManager.playPause()
                            }
                            Spacer()
                            
                            PlayBackControlButton(systemName: "goforward.10") {
                                player.currentTime += 10
                            }
                            Spacer()
                            
                            PlayBackControlButton(systemName: "stop.fill") {
                                audioManager.stop()
                                dismiss()
                            }
                        }
                    } else {
                        Text("Player is nil...")
                            .foregroundColor(.white)
                    }
            }
            .padding(20)
        }
        .onAppear {
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}
