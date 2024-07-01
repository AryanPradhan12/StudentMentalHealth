//
//  JournalView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject private var viewModel = JournalViewModel()
    @State private var newEntryText = ""

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Personal Journal")
                            .font(.title)
                            .bold()
                            .underline()
                    }
                    VStack {
                        List {
                            ForEach(viewModel.entries) { entry in
                                VStack(alignment: .leading) {
                                    Text(entry.text)
                                        .font(.headline)
                                    Text(entry.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .onDelete(perform: viewModel.deleteEntry)
                        }
                        
                        Divider()
                        
                        HStack {
                            TextField("Add your journal entry of the day...", text: $newEntryText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                viewModel.addEntry(entry: JournalEntry(text: newEntryText))
                                newEntryText = ""
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
