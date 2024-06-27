//
//  VideoGalleryView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 27/06/2024.
//

import SwiftUI

struct VideoGalleryView: View {
    @ObservedObject var viewModel: VideoGalleryViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.videos) { video in
                WebView(url: video.url)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
