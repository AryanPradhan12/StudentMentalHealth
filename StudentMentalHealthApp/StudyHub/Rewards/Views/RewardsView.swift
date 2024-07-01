//
//  RewardsView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 01/07/2024.
//

import SwiftUI
import Firebase

struct RewardsView: View {
    @StateObject private var viewModel = RewardsViewModel()
    @State private var break1Input: String = ""
    @State private var break1Duration: Int = 5
    @State private var break2Input: String = ""
    @State private var break2Duration: Int = 5
    @State private var break3Input: String = ""
    @State private var break3Duration: Int = 5
    @State private var isEditing: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Reward yourself when studying")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 20) {
                    RewardSectionView(title: "Break 1", input: $break1Input, duration: $break1Duration, isEditing: $isEditing)
                    RewardSectionView(title: "Break 2", input: $break2Input, duration: $break2Duration, isEditing: $isEditing)
                    RewardSectionView(title: "Break 3", input: $break3Input, duration: $break3Duration, isEditing: $isEditing)
                }
                .padding()
                
                HStack {
                    Button(action: {
                        saveAllRewards()
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Edit")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchRewards { rewards in
                self.updateProperties(rewards: rewards)
            }
        }
        .onChange(of: viewModel.rewards) { oldRewards, newRewards in
            self.updateProperties(rewards: newRewards)
        }
    }
    
    private func updateProperties(rewards: [String: Reward]) {
        self.break1Input = rewards["Break 1"]?.description ?? ""
        self.break1Duration = rewards["Break 1"]?.duration ?? 5
        self.break2Input = rewards["Break 2"]?.description ?? ""
        self.break2Duration = rewards["Break 2"]?.duration ?? 5
        self.break3Input = rewards["Break 3"]?.description ?? ""
        self.break3Duration = rewards["Break 3"]?.duration ?? 5
    }
    
    private func saveAllRewards() {
        let reward1 = Reward(id: "break1", title: "Break 1", description: break1Input, duration: break1Duration)
        let reward2 = Reward(id: "break2", title: "Break 2", description: break2Input, duration: break2Duration)
        let reward3 = Reward(id: "break3", title: "Break 3", description: break3Input, duration: break3Duration)
        
        viewModel.saveReward(reward: reward1)
        viewModel.saveReward(reward: reward2)
        viewModel.saveReward(reward: reward3)
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}

struct RewardSectionView: View {
    var title: String
    @Binding var input: String
    @Binding var duration: Int
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            if isEditing {
                TextField("Add your study break", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                
                Picker("Duration", selection: $duration) {
                    Text("5 minutes").tag(5)
                    Text("10 minutes").tag(10)
                }
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.white)
            } else {
                Text(input)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                
                Text("\(duration) minutes")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
    }
}
