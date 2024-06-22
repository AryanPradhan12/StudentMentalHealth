//
//  StudyView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 02/04/2024.
//

import SwiftUI

struct StudyView: View {

    @State private var isVisible = false
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("StudyhubBG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(0.7)
                    
                    VStack {
                        if isVisible {
                            Text("Welcome to the Study HUB!")
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
                                    destination: PomodoroView(),
                                    label: {
                                        VStack {
                                            Image(systemName: "timer")
                                                .foregroundColor(.white)
                                                .font(.system(size: 40))
                                            Text("Pomodoro Timer")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                        }
                                    }))
                    }
                    .offset(x: -90, y: -250)
                }
            }
        }
    }
}

#Preview {
    StudyView()
}
