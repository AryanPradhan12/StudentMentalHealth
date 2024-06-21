//
//  MotivationView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 02/04/2024.
//

import SwiftUI

struct MotivationView: View {
    
    @State private var isVisible = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("Meditationimage")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(0.7)
                    
                    VStack {
                        if isVisible {
                            Text("Welcome to the Motivation HUB!")
                                .bold()
                                .font(.system(size: 25))
                                .animation(.easeInOut(duration: 1.0))
                            Spacer()
                        }
                    }
                    .onAppear {
                        withAnimation {
                            self.isVisible = true
                        }
                    }
                    VStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .overlay(
                                NavigationLink(
                                    destination: GoalListView(),
                                    label: {
                                        VStack {
                                            Image("GoalSettingIcon")
                                                .resizable()
                                                .frame(width: 55, height: 50)
                                                .foregroundColor(.white)
                                            Text("Goal Setting")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                    }
                    .offset(x: -75, y: -250)
                }
                
            }
        }
        }
    }

#Preview {
    MotivationView()
}
