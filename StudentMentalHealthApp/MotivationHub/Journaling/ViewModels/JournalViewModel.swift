//
//  JournalViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []

    init() {
        fetchEntries()
    }

    func fetchEntries() {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("journalEntries")
            .order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }

                self.entries = documents.compactMap { document in
                    let data = document.data()
                    let id = document.documentID
                    let text = data["text"] as? String ?? ""
                    let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
                    return JournalEntry(id: id, text: text, date: date)
                }
            }
    }

    func addEntry(entry: JournalEntry) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("journalEntries")
            .addDocument(data: [
                "text": entry.text,
                "date": entry.date
            ]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    // Update locally
                    DispatchQueue.main.async {
                        self.entries.insert(entry, at: 0)
                        self.objectWillChange.send() // Notify SwiftUI of change
                    }
                }
            }
    }

    func deleteEntry(at offsets: IndexSet) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()
        let batch = db.batch()

        offsets.forEach { index in
            let entry = entries[index]
            let docRef = db.collection("users").document(uid).collection("journalEntries").document(entry.id)
            batch.deleteDocument(docRef)
        }

        batch.commit { error in
            if let error = error {
                print("Error deleting entries: \(error)")
            } else {
                // Update locally
                DispatchQueue.main.async {
                    self.entries.remove(atOffsets: offsets)
                    self.objectWillChange.send() // Notify SwiftUI of change
                }
            }
        }
    }
}
