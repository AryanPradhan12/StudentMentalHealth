//
//  ButtonView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 24/01/2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
          action()
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Value", background: .blue) {
            //Action
        }
    }
}
