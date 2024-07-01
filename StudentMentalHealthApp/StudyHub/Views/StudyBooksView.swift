//
//  StudyBooksView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import SwiftUI

struct StudyBooksView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("A List of Study Books")
                        .bold()
                        .underline()
                        .font(.title)
                }
                Spacer()
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            Image("DeepWorkBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Deep Work: Rules for Focused Success in a Distracted World")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Cal Newport")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("MakeItStickBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Make It Stick: The Science of Successful Learning")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Peter C. Brown")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("AtomicHabitsBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: James Clear")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("HowToBecomeBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("How to Become a Straight-A Student: The Unconventional Strategies Real College Students Use to Score High While Studying Less")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Cal Newport")
                                    .font(.system(size: 9))
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image("TheOrganizedMindBook")
                                .resizable()
                                .frame(width: 80, height: 130)
                            Spacer()
                            VStack {
                                Text("The Organized Mind: Thinking Straight in the Age of Information Overload")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 11))
                                Text("By: Daniel J. Levitin")
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
    StudyBooksView()
}
