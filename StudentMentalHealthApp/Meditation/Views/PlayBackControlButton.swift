//
//  PlayBackControlButton.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 23/03/2024.
//

import SwiftUI

struct PlayBackControlButton: View {
    var systemName: String = "Play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlayBackControlButton_Previews: PreviewProvider{
    static var previews: some View {
        PlayBackControlButton(action: {})
            .preferredColorScheme(.dark)
    }
}
