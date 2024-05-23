//
//  CircleButton.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 19/05/2024.
//

import SwiftUI

struct CircleButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .foregroundColor(Color("Light"))
                .frame(width: 60, height: 60)
                .background(Color("Dark")).opacity(0.5)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircleButton(icon: "play.fill") {
        print("hello")
    }
}
