//
//  HomePageViewViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 28/01/2024.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

//Had to allow To Do List page to identify the userId which had to be said in the homepage (so this class is a copy paste of MainViewViewModel).
class HomePageViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }

}

