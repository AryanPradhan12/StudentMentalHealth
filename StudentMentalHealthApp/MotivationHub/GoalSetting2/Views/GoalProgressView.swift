import SwiftUI

struct GoalProgressView: View {
    var goals: [Goal]
    
    var body: some View {
        let completedGoals = goals.filter { $0.isDone }.count
        let progress = goals.isEmpty ? 0 : (Double(completedGoals) / Double(goals.count)) * 100
        
        VStack {
            Text("Goals Completion")
                .font(.headline)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress / 100, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: progress)
                
                Text(String(format: "%.0f%%", min(progress, 100.0)))
                    .font(.largeTitle)
                    .bold()
            }
            .padding()
        }
    }
}
