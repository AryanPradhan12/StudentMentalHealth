//
//  GoalViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/06/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class GoalViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var priority = "Medium"
    @Published var goals: [Goal] = []
    @Published var showAlert = false
    
    init() {
        fetchGoals()
    }
    
    func save(completion: @escaping () -> Void) {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newGoal = Goal(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false,
            priority: priority)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("goals")
            .document(newId)
            .setData(newGoal.asDictionary()) { error in
                if error == nil {
                    self.fetchGoals()
                    completion()
                }
            }
    }
    
    func fetchGoals() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("goals")
            .getDocuments { snapshot, error in
                if let snapshot = snapshot {
                    self.goals = snapshot.documents.compactMap { doc in
                        let data = doc.data()
                        return Goal(
                            id: data["id"] as? String ?? "",
                            title: data["title"] as? String ?? "",
                            dueDate: data["dueDate"] as? TimeInterval ?? 0,
                            createdDate: data["createdDate"] as? TimeInterval ?? 0,
                            isDone: data["isDone"] as? Bool ?? false,
                            priority: data["priority"] as? String ?? "Medium")
                    }
                }
            }
    }
    
    func toggleIsDone(for goal: Goal) {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let updatedIsDone = !goal.isDone
        db.collection("users")
            .document(uId)
            .collection("goals")
            .document(goal.id)
            .updateData(["isDone": updatedIsDone]) { error in
                if error == nil {
                    // Update the local state of the goal
                    if let index = self.goals.firstIndex(where: { $0.id == goal.id }) {
                        self.goals[index].isDone = updatedIsDone
                    }
                }
            }
    }
    
    func deleteGoal(_ goal: Goal) {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("goals")
            .document(goal.id)
            .delete() { error in
                if error == nil {
                    self.goals.removeAll { $0.id == goal.id }
                }
            }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
