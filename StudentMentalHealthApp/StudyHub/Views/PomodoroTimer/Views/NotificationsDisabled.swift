//
//  NotificationsDisabled.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 19/05/2024.
//

import SwiftUI

struct NotificationsDisabled: View {
    var body: some View {
        VStack {
            Text("Notifications are disabled...")
                .font(.headline)
            Text("To be notified when the pomodoro timer ends please turn on notifications.")
                .font(.subheadline)
            Button("Open Settings") {
                openSettings()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color("Light"))
            .background(Color("Dark"))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .frame(maxWidth: .infinity)
            .padding(.vertical)
    }
    
    private func openSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    VStack {
        NotificationsDisabled()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("Dark"))
}
