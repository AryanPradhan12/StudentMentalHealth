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
                            Image("PowerOfNow")
                                .resizable()
                                .frame(width: 100, height: 80)
                            Spacer()
                            VStack {
                                Text("The Power Of Now")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("By: Eckhart Tolle")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
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
