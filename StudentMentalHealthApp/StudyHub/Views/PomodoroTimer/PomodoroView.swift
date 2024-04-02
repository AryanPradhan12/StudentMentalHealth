//
//  PadmoroView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 02/04/2024.
//

import SwiftUI

struct WorkTimerView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Text("25:00")
                    .font(.system(size: 98))
                    .foregroundColor(.white)
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    WorkTimerView()
}
