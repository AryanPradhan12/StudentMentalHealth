//
//  DayView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 26/06/2024.
//

import SwiftUI

struct DayView: View {
    let viewModel: DayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.day)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)
            
            ForEach(viewModel.exercises) { exercise in
                VStack(alignment: .leading, spacing: 5) {
                    Text(exercise.name)
                        .font(.headline)
                    Text(exercise.details)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
