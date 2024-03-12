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
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    Text("Home Page")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    if let userName = viewModel2.user?.name {
                        Text("Welcome, \(userName)")
                            .foregroundColor(Color.red)
                            .fontWeight(.semibold)
                    } else {
                        Text("Welcome")
                            .foregroundColor(Color.red)
                            .fontWeight(.semibold)
                        //Used if let, else statement to give the 'userName' property to the data collection from 'viewModel2' so then I can write 'userName' to print the name.
                    }
                    HStack {
                        NavigationLink(destination: NotificationView()) {
                            Image("Notificationsimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .offset(x:135, y: -80)
                    VStack {
                        Button(action: {
                            viewModel3.fetchQuote()
                        }) {
                            Image("APIButton")
                                .resizable()
                                .frame(width: 190, height: 50)
                                .offset(y: -70)
                        }
                        .padding()
                        
                        Text(viewModel3.quote)
                            .font(.system(size: 15))
                            .offset(y: -80)
                        
                    }
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    
                    LazyVGrid(columns: columns, spacing: 20) { // Use LazyVGrid for vertical grid layout
                                          Section("Features") {
                                              Rectangle()
                                                  .frame(width:150, height: 100)
                                                  .overlay(
                                              NavigationLink(destination: ToDoListView(userId: viewModel.currentUserId)) {
                                                  Text("To Do List")
                                                      .foregroundColor(.red)
                                              })
                                          }
                                          
                                          // Add more grid items here
                                      }
                    .foregroundColor(.yellow)
                    .background(Color.red)
                                      .fontWeight(.bold)
                                      .padding()
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
        }
    }

