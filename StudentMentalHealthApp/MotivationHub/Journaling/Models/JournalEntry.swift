//
//  JournalEntry.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import Foundation

struct JournalEntry: Identifiable {
    var id: String
    var text: String
    var date: Date
    
    init(id: String = UUID().uuidString, text: String, date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
}
