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
            Image("NotificationspageBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Image(systemName: "bell.and.waves.left.and.right.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 370, height: 240)
                    Text("Notifications Center")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Text("Enable notifications to stay in the loop,")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                    
                    Text("cancel at any time!")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                    
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            NotificationsManager.instance.requestAuthorization()
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                                .frame(width: 150, height: 80)
                                .overlay(
                                    Text("Enable")
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                )
                        }
                        Button(action: {
                            NotificationsManager.instance.cancelNotification()
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red)
                                .frame(width: 150, height: 80)
                                .overlay(
                                    Text("Disable")
                                        .bold()
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                )
                        }
                    }
                    HStack {
                        Button(action: {
                            NotificationsManager.instance.scheduleNotifications()
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 300, height: 80)
                                .overlay(
                                    HStack {
                                        Image(systemName: "calendar.badge.plus")
                                            .font(.system(size: 24))
                                            .foregroundColor(.red)
                                        Text("Schedule Notifications")
                                            .bold()
                                            .font(.system(size: 24))
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                            }

                Spacer()
                }
            .onAppear {
                UNUserNotificationCenter.current().setBadgeCount(0) { error in
                    if let error = error {
                        print("Failed to reset badge count: \(error.localizedDescription)")
                    } else {
                        print("Badge count reset successfully")
                    }
                }
                
            }
                
            }
        }
    }

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
