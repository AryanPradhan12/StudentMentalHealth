//
//  HomePageView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI
import Firebase

struct HomePageView: View {
    @StateObject var viewModel2 = ProfileViewViewModel()
    @StateObject var viewModel = HomePageViewViewModel()
    @StateObject private var viewModel3 = APIViewModel()
    @StateObject var audioManager = AudioManager()
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .Mycolor], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    Text("Home Page")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.homepagetextcolor)
                    if let userName = viewModel2.user?.name {
                        Text("Welcome, \(userName)")
                            .foregroundColor(Color.homepagetextcolor)
                            .fontWeight(.semibold)
                    } else {
                        Text("Welcome")
                            .foregroundColor(Color.homepagetextcolor)
                            .fontWeight(.semibold)
                        //Used if let, else statement to give the 'userName' property to the data collection from 'viewModel2' so then I can write 'userName' to print the name.
                    }
                    HStack {
                        NavigationLink(destination: NotificationView()) {
                            Image("Notificationsimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                    }
                    .offset(x:145, y: -70)
                    
                    HStack {
                        NavigationLink(destination: GetHelpView()) {
                            Image("GetHelpIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                    }
                    .offset(x:-145, y: -115)
                    VStack {
                        Button(action: {
                            viewModel3.fetchQuote()
                        }) {
                            Image("APIButton")
                                .resizable()
                                .frame(width: 160, height: 50)
                        }
                        .padding()
                        .offset(y: 10)
                        
                        Text(viewModel3.quote)
                            .font(.system(size: 12))
                            .frame(width: 350)
                    }
                    .foregroundColor(.homepagetextcolor)
                    .fontWeight(.bold)
                    .offset(y: -130)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Features")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.homepagetextcolor)
                        }
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 100))], spacing: 20) { // Use LazyVGrid for vertical grid layout
                        Section {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 120, height: 100)
                                .overlay(
                                    NavigationLink(destination: ToDoListView(userId: viewModel.currentUserId)) {
                                        VStack {
                                            Image("Todolisticon")
                                                .resizable()
                                                .frame(width: 50, height: 40)
                                            Text("To Do List")
                                                .font(.system(size: 10))
                                                .foregroundColor(.homepagesectiontextcolor)
                                        }
                                    })
                        }
                            Section {
                      RoundedRectangle(cornerRadius: 25)
                           .frame(width: 120, height: 100)
                           .overlay(
                            NavigationLink(destination: MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data)).environmentObject(audioManager)) {
                                VStack {
                                    Image("Meditationfeature")
                                        .resizable()
                                        .frame(width: 50, height: 40)
                                    Text("Meditation")
                                        .font(.system(size: 10))
                                        .foregroundColor(.homepagesectiontextcolor)
                                }
                            })
             }
                }
                        Section {
                  RoundedRectangle(cornerRadius: 25)
                       .frame(width: 270, height: 100)
                       .overlay(
                        NavigationLink(destination: GameView()) {
                            VStack {
                                Image("GameIcon")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                                Text("Memory game")
                                    .font(.system(size: 10))
                                    .foregroundColor(.homepagesectiontextcolor)
                            }
                        })
         }
                        Section {
                  RoundedRectangle(cornerRadius: 25)
                       .frame(width: 270, height: 100)
                       .overlay(
                        NavigationLink(destination: RateYourDayView()) {
                            VStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 40)
                                Text("Rate your day!")
                                    .font(.system(size: 10))
                                    .foregroundColor(.homepagesectiontextcolor)
                            }
                        })
         }
                                          // Add more grid items here
                                      }
                    .foregroundColor(.homepagetextcolor)
                                    .fontWeight(.bold)
                                      .padding()
                                      .offset(y: -100)
                }
            }
            .onAppear {
                viewModel2.fetchUser()
                //Fetching user details when the screen appears so that the app can print our user name by finding their data.
            }
            }
        }
    }
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView()
                .environmentObject(AudioManager())
        }
    }
