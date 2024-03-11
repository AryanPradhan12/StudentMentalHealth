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
        ZStack {
            Color.orange
                .ignoresSafeArea()
            Text("Notifications Center")
                .offset(y:-350)
                .bold()
                .font(.system(size: 35))
                .foregroundColor(Color.white)
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 150)
                    .overlay(
                        VStack {
                            Text(Constants.Notificationstext)
                                .foregroundColor(Color.orange)
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                            Text(Constants.Notificationstext2)
                                .foregroundColor(Color.red)
                                .font(.system(size: 18))
                        }
                )
            }
            .offset(y:-240)
            Rectangle()
                .fill(Color.white)
                .frame(width: 400, height: 300)
                .overlay(
            VStack() {
            Text("First allow us to send you notifications...")
                    .offset(y: -10)
                    .foregroundColor(Color.red)
                Button(action: {
                    NotificationsManager.instance.requestAuthorization()
                }) {
                    Image("NotificationsRequest")
                        .resizable()
                        .frame(width: 80, height: 50)
                }
                .offset(y: -20)
                
                Text("Now click on this button to start the notifcations...")
                    .offset(y: -30)
                    .foregroundColor(Color.red)
                Button(action: {
                    NotificationsManager.instance.scheduleNotifications()
                }) {
                    Image("NotificationsSchedule")
                        .resizable()
                        .frame(width: 80, height: 50)
                }
                .offset(y: -40)
                
                Text("Click this button to cancel all notifications...")
                    .offset(y: -50)
                    .foregroundColor(Color.red)
                
                Button(action: {
                    NotificationsManager.instance.cancelNotification()
                }) {
                    Image("NotificationsCancel")
                        .resizable()
                        .frame(width: 80, height: 50)
                }
                .offset(y: -60)
            }
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            )
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
