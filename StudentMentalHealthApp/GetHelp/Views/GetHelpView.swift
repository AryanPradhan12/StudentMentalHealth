//
//  GetHelpView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/03/2024.
//

import SwiftUI

struct GetHelpView: View {
    var body: some View {
            ZStack {
                LinearGradient(colors: [.homepagesectionsbackground, .Mycolor], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    Text("Get Help")
                        .foregroundColor(.homepagetextcolor)
                        .font(.system(size: 35))
                        .bold()
                        .offset(y: -350)
                        .underline()
                }
            }
        }
    }

#Preview {
    GetHelpView()
}
