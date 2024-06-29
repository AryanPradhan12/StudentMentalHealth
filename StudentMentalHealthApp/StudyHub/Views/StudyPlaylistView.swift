//
//  StudyPlaylistView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 29/06/2024.
//

import SwiftUI

struct StudyPlaylistView: View {
    @StateObject private var viewModel1 = StudyPlaylistViewModel()
    var body: some View {
        ZStack {
            Color.homepagesectionsbackground
                .ignoresSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("A List of Songs To Study With")
                        .font(.title)
                        .bold()
                        .font(.system(size: 15))
                        .underline()
                }
                
                VStack {
                    List(viewModel1.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title)
                                .bold()
                                .font(.system(size: 14))
                            Text(item.subtitle)
                                .font(.subheadline)
                                .font(.system(size: 12))
                        }
                        .listRowBackground(Color.homepagesectionsbackground)
                    }
                    .background(Color.homepagesectiontextcolor)
                }
            }
        }
    }
}

#Preview {
    StudyPlaylistView()
}
