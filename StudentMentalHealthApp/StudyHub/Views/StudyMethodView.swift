//
//  StudyMethodView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 29/06/2024.
//

import SwiftUI

struct StudyMethodView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Here are 9 Study Methods")
                            .font(.title)
                            .underline()
                            .bold()
                    }
                   Spacer()
                    ScrollView {
                    VStack {
                        HStack {
                            Image("InterleavedImage")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Interleaving")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("This involves studying different topics or concepts in a mixed order rather than focusing on one at a time. By switching back and forth, you strengthen your ability to differentiate between them and solidify your understanding of each.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("MnemonicDevicesImage")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Mnemonic Devices")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("These are memory aids that use techniques like acronyms, rhymes, or imagery to help you encode information. They make learning more engaging and improve long-term recall.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("BlurtingImage")
                                .resizable()
                                .frame(width: 130, height: 100)
                            Spacer()
                            VStack {
                                Text("Blurting")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("This technique involves freewriting everything you know about a topic for a set time, without worrying about structure or organization. It helps you test your understanding, brainstorm ideas, and potentially uncover knowledge gaps.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("DesirableDifficultiesImage")
                                .resizable()
                                .frame(width: 130, height: 100)
                            Spacer()
                            VStack {
                                Text("Desirable Difficulties")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("Desirable difficulties are a learning strategy that involves using challenging tasks to improve long-term learning. It's based on the idea that grappling with something to learn it will make it more memorable in the long run, although it might slow down your learning in the short term.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("ActiveRecallImage")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Active Recall")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("Active recall is another evidence-based study technique that involves testing yourself on the material you're trying to learn. This can be done through methods such as flashcards, practice problems, or writing out everything you know about a topic without looking at your notes.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("SpacedRepetitionImage")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Spaced Repetition")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("Spaced repetition refers to the practice of reviewing information at increasing intervals over time. This helps to solidify the information in your long-term memory and prevent you from forgetting it.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("TheForgettingCurve")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Curve of forgetting")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("This concept describes how information is lost from our memory over time. If you don't review information, you'll forget it quickly at first, and then more slowly over time. This is why spaced repetition is such an important study technique - it helps you review information at the right intervals to prevent forgetting.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image("SpacedRepetitionImage")
                                .resizable()
                                .frame(width: 180, height: 100)
                            Spacer()
                            VStack {
                                Text("Leitner system")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("This is a specific method for spaced repetition that uses flashcards. Here's how it works: you have a few boxes for your flashcards. Initially, all cards go in the first box. When you study a card and get it right, you move it to the next box. If you get it wrong, you move it back to a previous box for more frequent review. By moving cards between boxes based on how well you know them, you space out your reviews and improve your long-term memory.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                        HStack {
                            Image(systemName: "newspaper")
                                .resizable()
                                .frame(width: 100, height: 80)
                            Spacer()
                            VStack {
                                Text("Practice tests")
                                    .bold()
                                    .underline()
                                    .font(.system(size: 10))
                                Text("These are another great way to implement spaced repetition. Taking practice tests forces you to recall information from memory, which strengthens the neural pathways in your brain and helps you remember the material better. Additionally, practice tests can help you familiarize yourself with the format of the test and identify areas where you need more improvement.")
                                    .font(.system(size: 9))
                            }
                        }
                        .background(Color.white)
                    }
                    .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    StudyMethodView()
}
