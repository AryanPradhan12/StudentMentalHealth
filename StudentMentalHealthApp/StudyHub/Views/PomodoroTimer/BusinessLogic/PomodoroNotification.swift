//
//  PomodoroNotification.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 19/05/2024.
//

import Foundation
import UserNotifications

class PomodoroNotification {
    
    static func checkAuthorization(completion: @escaping (Bool) -> Void) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
                
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { allowed, error in
                completion(allowed)
                }
                
            default:
                completion(false)
            }
        }
    }
    
    static func scheduleNotification(seconds: TimeInterval, title: String, body: String) {
        let notificationCenter = UNUserNotificationCenter.current()
        //remove all current notifications
        notificationCenter.removeAllDeliveredNotifications()
        notificationCenter.removeAllPendingNotificationRequests()
        //setting up the content of the notifcation
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: PomodoroAudioSounds.done.resource))
        //setting up the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        //create the request
        let request = UNNotificationRequest(identifier: "my-notification", content: content, trigger: trigger)
        //add notification to the center
        notificationCenter.add(request)
        
        
    }
}
