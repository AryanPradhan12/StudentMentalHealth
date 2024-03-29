//
//  MeditationViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 24/03/2024.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 Minute Relaxing Meditation", description: "Take a moment amidst your busy student life to meditate. A few minutes of mindfulness can reduce stress, sharpen focus, and boost overall well-being. Dive into the calm within and discover a brighter, balanced you. Start today!", duration: 61, track: "meditation1", image: "Meditationimage")
}
