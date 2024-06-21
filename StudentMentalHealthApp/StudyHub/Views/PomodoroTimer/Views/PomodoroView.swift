//
//  PomodoroView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 18/05/2024.
//

import SwiftUI

struct PomodoroView: View {
    private var timer = PomodoroTimer(workInSeconds: 30 * 60, breakInSeconds: 5)
    
    @State private var displayWarning = false
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Text("Pomodoro Timer")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 150)
                
                // circle
                CircleTimer(fraction: timer.fractionPassed, primaryText: timer.secondsLeftString, secondaryText: timer.mode.rawValue)
                
                // buttons
                HStack {
                    // skip button
                    if timer.state == .idle && timer.mode == .pause {
                        CircleButton(icon: "forward.fill") {
                            timer.skip()
                        }
                    }
                    
                    
                    // start button
                    if timer.state == .idle {
                        CircleButton(icon: "play.fill") {
                            timer.start()
                        }
                    }
                    // resume button
                    if timer.state == .paused {
                        CircleButton(icon: "play.fill") {
                            timer.resume()
                        }
                    }
                    // pause button
                    if timer.state == .running {
                        CircleButton(icon: "pause.fill") {
                            timer.pause()
                        }
                    }
                    // reset button
                    if timer.state == .running || timer.state == .paused {
                        CircleButton(icon: "stop.fill") {
                            timer.reset()
                        }
                    }
                }
                // Notification disabled warning
                if displayWarning {
                    NotificationsDisabled()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color("Light"), Color("Dark")]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 500
                )
            )
            .onChange(of: scenePhase) {
                if scenePhase == .active {
                    PomodoroNotification.checkAuthorization {
                        authorized in
                        displayWarning = !authorized
                    }
                }
            }
        }
    }
}

#Preview {
    PomodoroView()
}
