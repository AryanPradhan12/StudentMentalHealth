//
//  RegisterView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.orange)
                    .rotationEffect(Angle(degrees: -15),anchor: .center)
                VStack {
                    Text("Register")
                        .font(.system(size:35))
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text("Create Your Account")
                        .foregroundColor(Color.white)
                        .font(.system(size:20))
                }
            }
            
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -100)
            .padding(.bottom, 50)
            Spacer()
        } //End of header
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
