//
//  GoalItemView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/06/2024.
//

import SwiftUI

struct GoalItemView: View {
    var goal: Goal
    var toggleIsDone: (Goal) -> Void
    var deleteGoal: (Goal) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(goal.title)
                    .font(.headline)
                Text("Due: \(Date(timeIntervalSince1970: goal.dueDate), formatter: DateFormatter.shortDate)")
                    .font(.subheadline)
                Text("Priority: \(goal.priority)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button(action: {
                toggleIsDone(goal)
            }) {
                Image(systemName: goal.isDone ? "checkmark.square.fill" : "square")
                    .foregroundColor(goal.isDone ? .green : .primary)
            }
            
            Button(action: {
                deleteGoal(goal)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
