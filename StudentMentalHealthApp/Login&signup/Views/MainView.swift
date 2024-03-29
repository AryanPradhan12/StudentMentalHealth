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
                }
            } else {
                LoginView()
            }
        }
    
        }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(StudentMentalHealthAppApp().audioManager)
    }
}
