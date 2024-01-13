//
//  StudentMentalHealthAppApp.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import FirebaseCore
import SwiftUI

@main
struct StudentMentalHealthAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
