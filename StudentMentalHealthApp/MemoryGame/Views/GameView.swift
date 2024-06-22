//
//  GameView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 23/05/2024.
//

import SwiftUI

struct GameView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.homepagesectionsbackground, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Text("🍽️ Food Wars! 🍽️")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .underline()
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                            ForEach(cards) { card in
                                CardView(card: card, width: Int(geo.size.width / 4 - 10), MatchedCards: $MatchedCards, UserChoices: $UserChoices, showAlert: $showAlert)
                            }
                        }
                        
                        VStack {
                            Text("Match these cards to win...")
                                .fontWeight(.semibold)
                                .underline()
                                .foregroundColor(.white)
                                .padding(.top, 20)
                            
                            LazyVGrid(columns: sixColumnGrid, spacing: 5) {
                                ForEach(cardValues, id: \.self) { cardValue in
                                    if !MatchedCards.contains(where: { $0.text == cardValue }) {
                                        Text(cardValue)
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 100)
                    }
                    .padding(.horizontal)
                    .background(Color.clear)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You have matched all the cards."),
                    dismissButton: .default(Text("Play Again"), action: {
                        resetGame()
                    })
                )
            }
        }
    }
    
    func resetGame() {
        cards = createCardList().shuffled()
        MatchedCards.removeAll()
        UserChoices.removeAll()
    }
}

#Preview {
    GameView()
}
