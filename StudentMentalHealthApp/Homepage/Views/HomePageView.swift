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
        NavigationStack {
            ZStack {
                Color("BkColor")
                    .ignoresSafeArea()
                VStack {
                    Text("Home Page")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                
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
