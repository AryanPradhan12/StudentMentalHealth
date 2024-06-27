//
//  VideoGalleryViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 27/06/2024.
//

import SwiftUI

class StudyVideoGalleryViewModel: ObservableObject {
    @Published var videoURLs: [String] = [
        "https://www.youtube.com/embed/VM8CSYby9SQ?si=rNtCAh-CyuuCj8yD",
        "https://www.youtube.com/embed/upBKD20aZRE?si=7k-OaiZ4njjhElYw",
        "https://www.youtube.com/embed/HZHbHL0dbnw?si=Si-E8_R1TSWi02tI",
        "https://www.youtube.com/embed/TjPFZaMe2yw?si=c8NVK-Vt0lxpTTZL"
    ]
}
