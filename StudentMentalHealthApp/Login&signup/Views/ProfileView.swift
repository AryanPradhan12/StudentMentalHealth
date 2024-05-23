//
//  ProfileView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
                VStack {
                    if let user = viewModel.user {
                        profile(user: user)
                    } else {
                        Text("Loading Profile...")
                    }
                }
                .navigationTitle("Profile")
            }
            .onAppear {
                viewModel.fetchUser()
            }
        }
    @ViewBuilder
    func profile(user: User) -> some View {
            //Avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            
            //Info of user
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .bold()
                    Text(user.name)
                        .underline()
                }
                .padding()
                HStack {
                    Text("Email:")
                        .bold()
                    Text(user.email)
                        .underline()
                }
                .padding()
                HStack {
                    Text("Member Since:")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        .underline()
                }
                .padding()
            }
            .padding()
            
            //Sign out option
            Button("Log Out") {
                viewModel.logOut()
            }
            .tint(.white)
            .fontWeight(.semibold)
            .padding()
            .padding(.horizontal, 20)
            .background(Color.red
                .cornerRadius(10)
                .shadow(radius: 10))
            
            Spacer()
            
            //Settings
        }
        }
        

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
