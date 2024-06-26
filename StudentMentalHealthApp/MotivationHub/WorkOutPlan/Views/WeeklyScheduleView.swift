//
//  WeeklyScheduleView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 26/06/2024.
//

import SwiftUI

struct WeeklyScheduleView: View {
    let days = [
        DayViewModel(day: "Monday", exercises: [
            Exercise(name: "Full Body Warm-Up and Light Cardio", details: """
            Jumping Jacks - 2 minutes
            Arm Circles - 1 minute forward, 1 minute backward
            High Knees - 2 minutes
            Bodyweight Squats - 3 sets of 10-15 reps
            Standing Calf Raises - 3 sets of 15-20 reps
            Brisk Walk or Light Jog - 10 minutes
            Cool Down Stretching - 5 minutes
            """),
            // Add other exercises for Monday
        ]),
        DayViewModel(day: "Tuesday", exercises: [
            Exercise(name: "Core and Flexibility", details: """
            Plank - 3 sets of 20-30 seconds
            Russian Twists - 3 sets of 15 reps per side
            Bicycle Crunches - 3 sets of 20 reps
            Leg Raises - 3 sets of 10-15 reps
            Seated Forward Bend - 2 minutes
            Child’s Pose - 2 minutes
            Spine Twists - 1 minute per side
            """),
            // Add other exercises for Tuesday
        ]),
        DayViewModel(day: "Wednesday", exercises: [
            Exercise(name: "Lower Body", details: """
            Walking Lunges - 3 sets of 10-15 reps per leg
            Glute Bridges - 3 sets of 15 reps
            Wall Sit - 3 sets of 30-45 seconds
            Side Leg Raises - 3 sets of 15 reps per leg
            Standing Hamstring Stretch - 1 minute per leg
            Quadriceps Stretch - 1 minute per leg
            """),
            // Add other exercises for Wednesday
        ]),
        DayViewModel(day: "Thursday", exercises: [
            Exercise(name: "Rest Day", details: """
            On this day you need to give your body a chance to recover from the strenuous activity from the past couple of days. Take this time to rejuvenate and work on other hobbies or activities.
            """)
        ]),
        DayViewModel(day: "Friday", exercises: [
            Exercise(name: "Upper Body and Flexibility", details: """
            Push-Ups - 3 sets of 8-12 reps (modify by doing on knees if needed)
            Tricep Dips - 3 sets of 10-15 reps
            Bicep Curls with Water Bottles - 3 sets of 15 reps
            Shoulder Press with Water Bottles - 3 sets of 15 reps
            Chest Stretch - 1 minute per side
            Upper Back Stretch - 1 minute
            """),
            // Add other exercises for Friday
        ]),
        DayViewModel(day: "Saturday", exercises: [
            Exercise(name: "Full Body Circuit", details: """
            Burpees - 3 sets of 10 reps
            Mountain Climbers - 3 sets of 20 reps
            Standing Side Crunches - 3 sets of 15 reps per side
            Standing Toe Touches - 3 sets of 15 reps
            Jump Rope or Marching in Place - 5 minutes
            Cool Down Stretching - 5 minutes
            """),
            // Add other exercises for Saturday
        ]),
        DayViewModel(day: "Sunday", exercises: [
            Exercise(name: "Rest Day", details: """
            On this day you need to give your body a chance to recover from the strenuous activity from the past couple of days. Take this time to rejuvenate and work on other hobbies or activities.
            """)
        ])
    ]

    var body: some View {
        ZStack {
            Color.homepagetextcolor
                .ignoresSafeArea(.all)
            
            ScrollView {
                
                VStack(spacing: 20) {
                    Text("Work Out Plan")
                        .font(.largeTitle)
                        .underline()
                        .padding(.bottom, 20)
                    
                    ForEach(days, id: \.day) { day in
                        DayView(viewModel: day)
                    }
                }
            }
            .padding()
        }
    }
}

struct WeeklyScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyScheduleView()
    }
}
