//
//  MotivationPlaylistView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 27/06/2024.
//

import SwiftUI

struct MotivationPlaylistView: View {
    @StateObject private var viewModel = MotivationPlaylistViewModel()
    var body: some View {
        ZStack {
            Color.homepagesectiontextcolor
                .ignoresSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("A List of Motivational Songs")
                        .font(.title)
                        .bold()
                        .font(.system(size: 15))
                        .underline()
                }
                
                VStack {
                    List(viewModel.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title)
                                .bold()
                                .font(.system(size: 14))
                            Text(item.subtitle)
                                .font(.subheadline)
                                .font(.system(size: 12))
                        }
                        .listRowBackground(Color.homepagesectiontextcolor)
                    }
                    .background(Color.homepagesectionsbackground)
                }
            }
        }
    }
}

#Preview {
    MotivationPlaylistView()
}
