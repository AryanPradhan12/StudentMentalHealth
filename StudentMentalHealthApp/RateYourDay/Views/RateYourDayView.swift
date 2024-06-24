//
//  RateYourDayView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 24/06/2024.
//

import SwiftUI

struct RateYourDayView: View {
    @State private var showAlert = false
    @State private var rating: Int? = nil
    @State private var reflection: String = ""
    @State private var userReflection: String = ""
    @State private var lastRatedDate: Date? = nil

    var body: some View {
        ZStack {
            LinearGradient(colors: [.Mycolor, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                if let rating = rating, !userReflection.isEmpty {
                    Text("Your rating: \(String(repeating: "★", count: rating))")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white) // Set text color to white for better contrast
                    
                    Text("Your reflection:")
                        .font(.headline)
                        .padding(.top)
                        .foregroundColor(.white) // Set text color to white for better contrast
                    
                    Text(userReflection)
                        .padding()
                        .foregroundColor(.white) // Set text color to white for better contrast
                    
                    Button(action: { showAlert = true }) {
                        Text("Change Rating")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                } else {
                    VStack {
                        Text("You haven't rated your day yet.")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white) // Set text color to white for better contrast
                        
                        Button(action: { showAlert = true }) {
                            Text("Rate Your Day")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            
            if showAlert {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Rate Your Day")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white) // Set text color to white for better contrast
                    
                    Text("How was your day?")
                        .padding(.top)
                        .foregroundColor(.white) // Set text color to white for better contrast
                    
                    HStack {
                        ForEach(1..<6) { star in
                            Image(systemName: star <= (rating ?? 0) ? "star.fill" : "star")
                                .foregroundColor(star <= (rating ?? 0) ? .yellow : .gray)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                    .padding()
                    
                    TextField("Write about your day...", text: $reflection)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    HStack {
                        Button(action: submitRating) {
                            Text("Submit")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(8)
                        }
                        
                        Button(action: { showAlert = false }) {
                            Text("Cancel")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                .frame(width: 300, height: 400) // Set the height of the alert frame to 400
                .background(Color.blue) // Set the background color of the alert to blue
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
        .onAppear(perform: checkIfRated)
    }

    private func checkIfRated() {
        let currentDate = Date()
        let calendar = Calendar.current
        
        if let lastRatedDate = UserDefaults.standard.object(forKey: "lastRatedDate") as? Date,
           calendar.isDateInToday(lastRatedDate) {
            self.rating = UserDefaults.standard.integer(forKey: "rating")
            self.userReflection = UserDefaults.standard.string(forKey: "reflection") ?? ""
        } else {
            showAlert = true
            resetDailyState()
        }
        
        lastRatedDate = UserDefaults.standard.object(forKey: "lastRatedDate") as? Date
        startDailyResetTimer()
    }

    private func submitRating() {
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "lastRatedDate")
        UserDefaults.standard.set(rating, forKey: "rating")
        UserDefaults.standard.set(reflection, forKey: "reflection")
        userReflection = reflection
        lastRatedDate = currentDate
        showAlert = false
    }

    private func resetDailyState() {
        rating = nil
        reflection = ""
        userReflection = ""
        UserDefaults.standard.removeObject(forKey: "rating")
        UserDefaults.standard.removeObject(forKey: "reflection")
    }

    private func startDailyResetTimer() {
        let calendar = Calendar.current
        let now = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: now)!
        let tomorrowMidnight = calendar.startOfDay(for: tomorrow)
        
        let timeInterval = tomorrowMidnight.timeIntervalSince(now)
        
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
            self.resetDailyState()
            self.showAlert = true
        }
    }
}

struct RateYourDayView_Previews: PreviewProvider {
    static var previews: some View {
        RateYourDayView()
    }
}
