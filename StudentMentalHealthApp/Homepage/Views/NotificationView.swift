//
//  NotificationView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 10/03/2024.
//

import SwiftUI
import UserNotifications

class NotificationsManager {
    
static let instance = NotificationsManager()
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
       
    }
    func scheduleNotifications() {
        var dateComponents = DateComponents()
        dateComponents.hour = 18
        dateComponents.minute = 30
        dateComponents.weekday = 2
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "Hope you are having a blessed day!"
        content.subtitle = "Come visit the SMH app and make your day better!"
        content.sound = .default
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}


struct NotificationView: View {
    var body: some View {
        VStack() {
            Button("Request permission") {
                NotificationsManager.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationsManager.instance.scheduleNotifications()
            }
            Button("Cancel Notification") {
                NotificationsManager.instance.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
   
}

#Preview {
    NotificationView()
}
