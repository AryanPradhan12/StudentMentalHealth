//
//  GoalModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/06/2024.
//

import Foundation

struct Goal: Identifiable {
    var id: String
    var title: String
    var dueDate: TimeInterval
    var createdDate: TimeInterval
    var isDone: Bool
    var priority: String // E.g., "High", "Medium", "Low"
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "title": title,
            "dueDate": dueDate,
            "createdDate": createdDate,
            "isDone": isDone,
            "priority": priority
        ]
    }
}
