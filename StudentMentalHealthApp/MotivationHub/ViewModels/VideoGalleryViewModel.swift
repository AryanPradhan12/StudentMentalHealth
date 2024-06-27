//
//  VideoGalleryViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 27/06/2024.
//

import Foundation

class VideoGalleryViewModel: ObservableObject {
    @Published var videos: [Video]
    
    init() {
        self.videos = [
            Video(url: URL(string: "https://www.youtube.com/embed/QTB1YiWxxKU?si=bs8ZsxotJmIELuRY")!),
            Video(url: URL(string: "https://www.youtube.com/embed/tbnzAVRZ9Xc?si=2RmWeTt1EXEi80YU")!),
            Video(url: URL(string: "https://www.youtube.com/embed/rPVlKOc0-rs?si=ygc2ZCnKnDyXL5dU")!),
            Video(url: URL(string: "https://www.youtube.com/embed/QeiYLF-JaY0?si=4De1Ja1R5fzvr7t8")!)
        ]
    }
}
