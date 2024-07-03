//
//  MotivationalBooksView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 29/06/2024.
//

import SwiftUI

struct MotivationalBooksView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("A List of Motivational Books")
                        .bold()
                        .underline()
                        .font(.title)
                }
                Spacer()
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            Image("PowerOfNow")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("The Power Of Now")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 13))
                                Text("By: Eckhart Tolle")
                                    .font(.system(size: 11))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("AwakenTheGiantWithin")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Awaken The Giant Within")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 13))
                                Text("By: Tony Robbins")
                                    .font(.system(size: 11))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("DriveBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Drive: The Surprising Truth About What Motivates Us")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Daniel H. Pink")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("GritBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Grit: The Power of Passion and Perseverance")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Angela Duckworth")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("7HabitsBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("The 7 Habits of Highly Effective People")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Stephen R. Covey")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    MotivationalBooksView()
}