//
//  HeaderView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 15))
                
            
            VStack {
                Text("Student Mental Health")
                    .font(.system(size:35))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Improve your mental health")
                    .foregroundColor(Color.white)
                    .font(.system(size:20))
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
