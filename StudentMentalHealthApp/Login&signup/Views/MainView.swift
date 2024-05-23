//
//  ContentView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //Signed in state
                TabView {
                    
                    HomePageView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                    MotivationView()
                        .tabItem {
                            Label("MotivationHub", systemImage: "figure.strengthtraining.traditional")
                        }
                    StudyView()
                        .tabItem {
                            Label("StudyHub", systemImage: "graduationcap.fill")
                        }
                }
            } else {
                LoginView()
            }
        }
    
        }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AudioManager())
    }
}
