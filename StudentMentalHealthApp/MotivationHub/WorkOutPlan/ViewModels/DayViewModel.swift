//
//  DayViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 26/06/2024.
//

import Foundation

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let details: String
}

struct DayViewModel {
    let day: String
    let exercises: [Exercise]
}
