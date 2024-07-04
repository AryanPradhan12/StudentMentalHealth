//
//  ResourcesView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 04/07/2024.
//

import SwiftUI

struct ResourcesView: View {
    let articles = [
        ("12 Tips For Studying Better", "Being well-organized and prepared for tests and exams can have a significant impact on academic performance. Effective studying begins with the right mindset - adopting a positive outlook can transform studying from a chore to an opportunity for learning.", "https://www.oxfordlearning.com/how-to-study-effectively/"),
        ("4 Ways to Improve Focus and Memory", "As you grow older, it may become more challenging to maintain focus and effectively absorb information. This is not just your imagination - it is a normal part of the aging process. Research has shown that many cognitive skills, including memory, begin to decline as early as age 45. The aging process leads to gradual changes in various abilities associated with thinking and recollection.", "https://www.health.harvard.edu/mind-and-mood/4-ways-to-improve-focus-and-memory"),
        ("6 Ways to Boost Brainpower", "Amputees often experience phantom limb sensations, feeling sensations from limbs that no longer exist. Neuroscientist Vilayanur S. Ramachandran worked with patients like Tom, who had lost an arm, and found that touching his face produced sensations in his missing fingers. This is because the brain's somatosensory cortex, which processes sensations, had reorganized, with the region for the hand taking over the face's territory. This neuroplasticity, the brain's ability to change and rewire itself, is a remarkable feature of the adult brain. Researchers also know that the brain can generate new neurons, a process called neurogenesis, which is influenced by factors like mental and physical exercise.", "https://www.scientificamerican.com/article/six-ways-to-boost-brainpower/#:~:text=Research%20has%20shown%20that%20exercise,communication%20and%20survival%20of%20neurons."),
        ("How to Optimize Your Brain", "Maintaining strong focus and high productivity are essential for achieving success, but sustaining these abilities throughout the day can be challenging. However, there is a way to enhance both of these crucial skills, and that is by optimizing the performance of your brain.", "https://www.forbes.com/sites/ashiraprossack1/2021/06/27/how-to-optimize-your-brain-to-improve-focus-and-productivity/")
    ]

    var body: some View {
        ZStack {
            Color.homepagetextcolor
                .ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    Text("External Reading Material")
                        .font(.title)
                        .bold()
                        .underline()
                        .padding(.bottom, 10)
                        .foregroundColor(.black)
                    
                    ForEach(articles, id: \.2) { title, description, link in
                        ArticleView(title: title, description: description, urlString: link)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(radius: 5)
                    }
                }
            }
        }
    }
}

struct ArticleView: View {
    let title: String
    let description: String
    let urlString: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(description)
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(4) // Adjust as needed
            
            Link("Read more", destination: URL(string: urlString)!)
                .font(.caption)
                .foregroundColor(.blue)
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
