//
//  Reward.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import Foundation

struct Reward: Identifiable, Equatable {
    var id: String
    var title: String
    var description: String
    var duration: Int
    
    static func == (lhs: Reward, rhs: Reward) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.duration == rhs.duration
    }
}
