//
//  APIViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 12/03/2024.
//

import Foundation

class APIViewModel: ObservableObject {
    @Published var quote = "Click button to get a quote"
    
    func fetchQuote() {
        guard let url = URL(string: "https://stoic.tekloon.net/stoic-quote") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            if let data = data,
               let quoteResponse = try? JSONDecoder().decode(QuoteResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.quote = quoteResponse.quote
                }
            }
        }.resume()
    }
}

struct QuoteResponse: Codable {
    let quote: String
}
