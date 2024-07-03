//
//  MotivationView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 02/04/2024.
//

import SwiftUI

struct MotivationView: View {
    @StateObject private var videoGalleryViewModel = VideoGalleryViewModel()
    @State private var isVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("MotivationhubBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                
                VStack {
                    if isVisible {
                        Text("Welcome to the Motivation HUB!")
                            .bold()
                            .font(.system(size: 25))
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 1.0), value: isVisible)
                        Spacer()
                    }
                }
                .onAppear {
                    withAnimation {
                        self.isVisible = true
                    }
                }
                
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            NavigationLink(
                                destination: GoalListView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.homepagetextcolor)
                                        .overlay(
                                            VStack {
                                                Image("GoalSettingIcon")
                                                    .resizable()
                                                    .frame(width: 55, height: 50)
                                                    .foregroundColor(.white)
                                                Text("Goal Setting")
                                                    .foregroundColor(.homepagesectiontextcolor)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                            }
                                        )
                                }
                            )
                            
                            NavigationLink(
                                destination: WeeklyScheduleView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.homepagetextcolor)
                                        .overlay(
                                            VStack {
                                                Image(systemName: "dumbbell")
                                                    .resizable()
                                                    .frame(width: 55, height: 35)
                                                    .foregroundColor(.black)
                                                Text("Work Out Plan")
                                                    .foregroundColor(.homepagesectiontextcolor)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                            }
                                        )
                                }
                            )
                            
                            NavigationLink(
                                destination: MotivationPlaylistView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.homepagetextcolor)
                                        .overlay(
                                            VStack {
                                                Image(systemName: "music.note.list")
                                                    .resizable()
                                                    .frame(width: 45, height: 35)
                                                    .foregroundColor(.black)
                                                Text("Motivational Playlist")
                                                    .foregroundColor(.homepagesectiontextcolor)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 12))
                                            }
                                        )
                                }
                            )
                            NavigationLink(
                                destination: MotivationalBooksView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.homepagetextcolor)
                                        .overlay(
                                            VStack {
                                                Image(systemName: "book.closed")
                                                    .resizable()
                                                    .frame(width: 35, height: 35)
                                                    .foregroundColor(.black)
                                                Text("Motivational Books")
                                                    .foregroundColor(.homepagesectiontextcolor)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 12))
                                            }
                                        )
                                }
                            )
                            NavigationLink(
                                destination: JournalView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.homepagetextcolor)
                                        .overlay(
                                            VStack {
                                                Image(systemName: "note.text")
                                                    .resizable()
                                                    .frame(width: 35, height: 35)
                                                    .foregroundColor(.black)
                                                Text("Journaling")
                                                    .foregroundColor(.homepagesectiontextcolor)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 12))
                                            })
                                })
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        VStack {
                            VideoGalleryView(viewModel: videoGalleryViewModel)
                                .frame(width: 250, height: 200)
                                .overlay(
                                            Rectangle()
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                            
                            Image("Motivationimage1")
                                .resizable()
                                .frame(width: 250, height: 200)
                                .overlay(
                                            Rectangle()
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                            
                            Image("Motivationimage2")
                                .resizable()
                                .frame(width: 250, height: 200)
                                .overlay(
                                            Rectangle()
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                            
                            Spacer()
                        }
                        .padding(.trailing)
                    }
                    .padding(.top, 50)
                }
            }
        }
    }

#Preview {
    MotivationView()
}
