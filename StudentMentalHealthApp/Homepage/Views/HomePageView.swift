//
//  HomePageView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI

struct HomePageView: View {
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
            }
        }
    }
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView()
        }
    }

