//
//  MotviationPlaylistViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 28/06/2024.
//

import Foundation
import SwiftUI


struct MotivationItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

class MotivationPlaylistViewModel: ObservableObject {
    @Published var items: [MotivationItem] = [
        MotivationItem(title: "Physical", subtitle: "Dua Lipa"),
        MotivationItem(title: "Cooler Than Me - Single Mix", subtitle: "Mike Posner, Gigamesh"),
        MotivationItem(title: "Bulletproof", subtitle: "La Roux, GAMPER & DADONI"),
        MotivationItem(title: "Viva La Vida", subtitle: "Coldplay"),
        MotivationItem(title: "I Ain't Worried", subtitle: "OneRepublic"),
        MotivationItem(title: "she's all I wanna be - Acoustic", subtitle: "Tate McRae"),
        MotivationItem(title: "Burn", subtitle: "Ellie Goulding"),
        MotivationItem(title: "Glorious", subtitle: "Macklemore, Skylar Grey"),
        MotivationItem(title: "Run", subtitle: "OneRepublic"),
        MotivationItem(title: "Espresso", subtitle: "Sabrina Carpenter"),
        MotivationItem(title: "Sucker", subtitle: "Jonas Brothers"),
        MotivationItem(title: "Hall of Fame", subtitle: "The Script"),
        MotivationItem(title: "Blinding Lights", subtitle: "The Weekend"),
        MotivationItem(title: "Can't Hold Us", subtitle: "Macklemore, Ryan Lewis"),
        MotivationItem(title: "Blow Your Mind", subtitle: "Dua Lipa"),
        MotivationItem(title: "Training Season", subtitle: "Dua Lipa"),
        MotivationItem(title: "Shivers", subtitle: "Ed Sheeran"),
        MotivationItem(title: "This Is What You Came For", subtitle: "Calvin Harris, Rihanna"),
        MotivationItem(title: "Part Of Me", subtitle: "Katy Perry"),
        MotivationItem(title: "Adventure of a Lifetime", subtitle: "Coldplay"),
        MotivationItem(title: "good 4 u", subtitle: "Olivia Rodrigo"),
        MotivationItem(title: "Alibi", subtitle: "Ella Henderson, Rudimental"),
        MotivationItem(title: "Von dutch", subtitle: "Charli xcx"),
        MotivationItem(title: "Rise", subtitle: "Jonas Blue, IZ*ONE"),
        MotivationItem(title: "Heroes (we could be)", subtitle: "Alesso, Tove Lo"),
        MotivationItem(title: "What the Hell", subtitle: "Avril Lavigne"),
        MotivationItem(title: "Stronger (What Doesn't Kill You)", subtitle: "Kelly Clarkson"),
        MotivationItem(title: "As It Was", subtitle: "Harry Styles"),
        MotivationItem(title: "Greedy", subtitle: "Tate McRae"),
        MotivationItem(title: "The Greatest", subtitle: "Sia"),
        MotivationItem(title: "Feel This Moment", subtitle: "Pitbull, Christina Aguilera"),
        MotivationItem(title: "Whatever It Takes", subtitle: "Imagine Dragons"),
        MotivationItem(title: "Animal", subtitle: "Neon trees"),
        MotivationItem(title: "Kings & Queens", subtitle: "Ava Max"),
        MotivationItem(title: "Lil Boo Thang", subtitle: "Paul Russell"),
        MotivationItem(title: "There's Nothing Holdin' Me Back", subtitle: "Shawn Mendes"),
        MotivationItem(title: "Lovers In A Past Life", subtitle: "Calvin Harris, Rag'n'Bone Man"),
        MotivationItem(title: "The Motto", subtitle: "Tiësto, Ava Max"),
        MotivationItem(title: "Numb", subtitle: "Marshmello, Khalid"),
        MotivationItem(title: "The Business", subtitle: "Tiësto"),
        MotivationItem(title: "Cake By The Ocean", subtitle: "DNCE"),
        MotivationItem(title: "Dakota", subtitle: "Stereophonics"),
        MotivationItem(title: "Shut Up and Dance", subtitle: "WALK THE MOON"),
        MotivationItem(title: "Runnin' (Lose It All)", subtitle: "Naughty Boy, Beyoncé, Arrow Benjamin"),
        MotivationItem(title: "The Middle", subtitle: "Jimmy Eat World"),
        MotivationItem(title: "Titanium", subtitle: "David Guetta, Sia"),
        MotivationItem(title: "Take My Breath", subtitle: "The Weekend"),
        MotivationItem(title: "I'm The One", subtitle: "DJ Khalid, Justin Bieber, Quavo, Chance the Rapper"),
        MotivationItem(title: "Players", subtitle: "Coi Leray"),
        MotivationItem(title: "Weekend Offender", subtitle: "ADMT"),
        MotivationItem(title: "Escapism.", subtitle: "RAYE, 070 Shake"),
        MotivationItem(title: "24K Magic", subtitle: "Bruno Mars"),
        MotivationItem(title: "About Damn Time", subtitle: "Lizzo"),
        MotivationItem(title: "Confident", subtitle: "Demi Lovato"),
        MotivationItem(title: "I'm Good (Blue)", subtitle: "David Guetta, Bebe Rexha"),
        MotivationItem(title: "Don't Break the Heart", subtitle: "Tom Grennan"),
        MotivationItem(title: "Commander", subtitle: "Kelly Rowland, David Guetta"),
        MotivationItem(title: "Wake Me Up", subtitle: "Avicii"),
        MotivationItem(title: "My Type", subtitle: "Saint Motel"),
        MotivationItem(title: "Power", subtitle: "Little Mix, Stormzy"),
        MotivationItem(title: "abcdefu", subtitle: "GAYLE"),
        MotivationItem(title: "Thunder", subtitle: "Imagine Dragons"),
        MotivationItem(title: "High Hopes", subtitle: "Panic! At The Disco"),
        MotivationItem(title: "BREAK MY SOUL", subtitle: "Beyoncé"),
        MotivationItem(title: "We Ain't Here For Long", subtitle: "Nathan Dawe"),
        MotivationItem(title: "yes, and?", subtitle: "Ariana Grande"),
        MotivationItem(title: "Kids", subtitle: "MGMT"),
        MotivationItem(title: "Rather Be", subtitle: "Clean Bandit, Jess Glynne"),
        MotivationItem(title: "Fighter", subtitle: "Christina Aguilera"),
        MotivationItem(title: "Somebody Told Me", subtitle: "The Killers"),
        MotivationItem(title: "These Words", subtitle: "Natasha Bedingfield"),
        MotivationItem(title: "Pompeii", subtitle: "Bastille"),
        MotivationItem(title: "You Need Me, I Don't Need You", subtitle: "Ed Sheeran"),
        MotivationItem(title: "Beggin'", subtitle: "Måneskin"),
        MotivationItem(title: "Can't Tame Her", subtitle: "Zara Larsson"),
        MotivationItem(title: "Hot In It - Riton Remix", subtitle: "Tiësto, Riton, Charli xcx"),
        MotivationItem(title: "Style", subtitle: "Taylor Swift"),
        MotivationItem(title: "Don't You Worry Child", subtitle: "Swedish House Mafia, John Martin"),
        MotivationItem(title: "Run This Town", subtitle: "JAY-Z, Rihanna, Kanye West"),
        MotivationItem(title: "Break Free", subtitle: "Ariana Grande, Zedd"),
        MotivationItem(title: "Champion", subtitle: "Fall Out Boy"),
        MotivationItem(title: "Can't Stop", subtitle: "Red Hot Chili Peppers"),
        MotivationItem(title: "Champion", subtitle: "Chris Brown, Chip"),
    ]
}
