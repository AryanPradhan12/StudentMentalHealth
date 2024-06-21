//
//  AddGoalView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/06/2024.
//

import SwiftUI

struct AddGoalView: View {
    @ObservedObject var viewModel: GoalViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                
                Picker("Priority", selection: $viewModel.priority) {
                    Text("High").tag("High")
                    Text("Medium").tag("Medium")
                    Text("Low").tag("Low")
                }
                
                Button(action: {
                    viewModel.save {
                        // After saving, reset the text fields
                        viewModel.title = ""
                        viewModel.dueDate = Date()
                        viewModel.priority = "Medium"
                        
                        // Close the AddGoalView
                        isPresented = false
                    }
                }) {
                    Text("Save")
                }
                .disabled(!viewModel.canSave)
            }
            .navigationTitle("Add Goal")
        }
        .onAppear {
            // Reset text fields when the view appears
            viewModel.title = ""
            viewModel.dueDate = Date()
            viewModel.priority = "Medium"
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView(viewModel: GoalViewModel(), isPresented: .constant(true))
    }
}
