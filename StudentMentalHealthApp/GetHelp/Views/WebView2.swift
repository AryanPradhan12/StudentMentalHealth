//
//  WebView2.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 05/07/2024.
//

import SwiftUI
import WebKit

struct WebView2: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
