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
    var body: some View {
        NavigationView {
            ZStack {
                Color("BkColor")
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
                        .offset(x:135, y: -65)
                        List {
                            Section("Features") {
                                NavigationLink(destination: ToDoListView(userId: viewModel.currentUserId)) {
                                    
                                    Text("To Do List")}
                            }
                        }
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
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

