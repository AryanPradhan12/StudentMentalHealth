//
//  GetHelpView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/03/2024.
//

import SwiftUI

struct GetHelpView: View {
    var body: some View {
        ZStack {
            Image("GetHelpBG")
                .resizable()
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Get Help")
                            .foregroundColor(.black)
                            .font(.title)
                            .font(.system(size: 35))
                            .bold()
                    }
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill()
                            .frame(width: 380, height: 180)
                            .overlay (
                                VStack {
                                    Text("Need help with understanding all the features on the app? Don't worry we've got you...")
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Text("Here is an instructional video that is sure to answer all your questions about the app's functionality...")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                    .padding()
                            )
                        
                        // Add the video player view here
                        VideoPlayerView(videoName: "AppScreenRecord", videoType: "mp4")
                            .frame(width: 380, height: 200)
                            .cornerRadius(15)
                    }
                    Spacer()
                    
                    VStack {
                        Text("About Us")
                            .foregroundColor(.black)
                            .font(.title)
                            .font(.system(size: 35))
                            .bold()
                        RoundedRectangle(cornerRadius: 15)
                            .fill()
                            .frame(width: 380, height: 300)
                            .overlay (
                                VStack {
                                    Text("The Student Mental Health App is an interactive application developed by Aryan Pradhan, Adithya Nishant, and Devaditya Tuteja. Our goal is to support students globally by emphasizing the importance of organizing their busy lives effectively. By incorporating a range of features tailored to enhance mental well-being, this app aims to empower students in managing their mental health proactively.")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                    .padding()
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    GetHelpView()
}
