//
//  StudyView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 02/04/2024.
//

import SwiftUI

struct StudyView: View {
    @StateObject private var videoGalleryViewModel = StudyVideoGalleryViewModel()
    @State private var isVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("StudyhubBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                
                VStack {
                    if isVisible {
                        Text("Welcome to the Study HUB!")
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
                    VStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.homepagetextcolor)
                            .overlay(
                                NavigationLink(
                                    destination: PomodoroView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "timer")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40))
                                            Text("Pomodoro Timer")
                                                .foregroundColor(.homepagesectiontextcolor)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.homepagetextcolor)
                            .overlay(
                                NavigationLink(
                                    destination: StudyPlaylistView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "music.note.list")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40))
                                            Text("Study Playlist")
                                                .foregroundColor(.homepagesectiontextcolor)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.homepagetextcolor)
                            .overlay(
                                NavigationLink(
                                    destination: StudyMethodView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "book.circle")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40))
                                            Text("Study Methods")
                                                .foregroundColor(.homepagesectiontextcolor)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.homepagetextcolor)
                            .overlay(
                                NavigationLink(
                                    destination: StudyBooksView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "book")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40))
                                            Text("Study Books")
                                                .foregroundColor(.homepagesectiontextcolor)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.homepagetextcolor)
                            .overlay(
                                NavigationLink(
                                    destination: RewardsView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "gift")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40))
                                            Text("Study Rewards")
                                                .foregroundColor(.homepagesectiontextcolor)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    VStack {
                        StudyVideoGalleryView(viewModel: videoGalleryViewModel)
                            .frame(width: 250, height: 200)
                            .overlay(
                                        Rectangle()
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                        
                        Image("StudyImage1")
                            .resizable()
                            .frame(width: 250, height: 200)
                            .overlay(
                                        Rectangle()
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                        
                        Image("StudyImage2")
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
    StudyView()
}
