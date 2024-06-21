//
//  GoalListView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/06/2024.
//

import SwiftUI

struct GoalListView: View {
    @StateObject private var viewModel = GoalViewModel()
    @State private var showingAddGoalView = false
    
    var body: some View {
        NavigationView {
            VStack {
                GoalProgressView(goals: viewModel.goals)
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.goals) { goal in
                            GoalItemView(
                                goal: goal,
                                toggleIsDone: viewModel.toggleIsDone,
                                deleteGoal: { goal in viewModel.deleteGoal(goal) }
                            )
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Goals")
            .navigationBarItems(trailing: Button("Add Goal") {
                showingAddGoalView = true
            })
            .sheet(isPresented: $showingAddGoalView) {
                AddGoalView(viewModel: viewModel, isPresented: $showingAddGoalView)
            }
        }
    }
}

struct GoalListView_Previews: PreviewProvider {
    static var previews: some View {
        GoalListView()
    }
}
