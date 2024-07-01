//
//  RewardsViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import Firebase
import Combine

class RewardsViewModel: ObservableObject {
    @Published var rewards: [String: Reward] = [:]
    
    func fetchRewards(completion: @escaping ([String: Reward]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            completion([:])
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(uid)
        
        userRef.collection("rewards").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching rewards: \(error)")
                completion([:])
                return
            }
            
            var rewards: [String: Reward] = [:]
            
            snapshot?.documents.forEach { document in
                let data = document.data()
                if let title = data["title"] as? String,
                   let description = data["description"] as? String,
                   let duration = data["duration"] as? Int {
                    rewards[title] = Reward(id: document.documentID, title: title, description: description, duration: duration)
                }
            }
            
            self.rewards = rewards
            completion(rewards)
        }
    }
    
    func saveReward(reward: Reward) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(uid)
        
        userRef.collection("rewards").document(reward.id).setData([
            "title": reward.title,
            "description": reward.description,
            "duration": reward.duration
        ]) { error in
            if let error = error {
                print("Error saving reward:", error.localizedDescription)
            } else {
                print("Reward saved successfully")
            }
        }
    }
}
