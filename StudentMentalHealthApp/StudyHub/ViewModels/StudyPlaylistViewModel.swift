//
//  StudyPlaylistViewModel.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 29/06/2024.
//

import Foundation
import SwiftUI


struct StudyItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

class StudyPlaylistViewModel: ObservableObject {
    @Published var items: [StudyItem] = [
        StudyItem(title: "Cotton", subtitle: "marsquake, Trix."),
        StudyItem(title: "Hide and Seek", subtitle: "C4C, Youthology, xander."),
        StudyItem(title: "Visual Diary", subtitle: "Grisp"),
        StudyItem(title: "Old Light", subtitle: "Allem Iversom, Iangwish"),
        StudyItem(title: "Sundays at Sea", subtitle: "Trix., okinami, marsquake"),
        StudyItem(title: "Life is Good", subtitle: "Yles, fnonose"),
        StudyItem(title: "Resilience", subtitle: "Arbour"),
        StudyItem(title: "Lowsun", subtitle: "ron quixote"),
        StudyItem(title: "Willow Tree", subtitle: "marsquake"),
        StudyItem(title: "Resilience", subtitle: "Arbour"),
        StudyItem(title: "in pools of light", subtitle: "azayaka, tonbo"),
        StudyItem(title: "The Meadow", subtitle: "Horace Maurice"),
        StudyItem(title: "Riding Your Bike", subtitle: "C4C, Allem Iversom"),
        StudyItem(title: "acadia", subtitle: "tonbo"),
        StudyItem(title: "i see you in the stars", subtitle: "GAB5"),
        StudyItem(title: "lapwing.-9pm falling version", subtitle: "Memory Phoam, Most Every Day"),
        StudyItem(title: "window", subtitle: "sove"),
        StudyItem(title: "Fragile", subtitle: "yani, Coloured Rocks"),
        StudyItem(title: "Sea Shells", subtitle: "marsquake, flowray"),
        StudyItem(title: "Night Glow", subtitle: "Allem Iversom, Dontcry"),
        StudyItem(title: "with leaves in the sky", subtitle: "azayaka, tonbo"),
        StudyItem(title: "on a boat", subtitle: "noni"),
        StudyItem(title: "balluimo", subtitle: "Japuya"),
        StudyItem(title: "Azure Bay", subtitle: "Felix Hien"),
        StudyItem(title: "Her Eyes", subtitle: "xander."),
        StudyItem(title: "Felt On Summer", subtitle: "Dosi, Swink"),
        StudyItem(title: "Mountain Light", subtitle: "Felt Galaxy, Cayson Renshaw, xander."),
        StudyItem(title: "Camp Friends", subtitle: "Strenhlow, azayaka"),
        StudyItem(title: "Better Days", subtitle: "Nation's Ghost, Baileys Ghost, DatBoiBaz"),
        StudyItem(title: "Home", subtitle: "No Spirit"),
        StudyItem(title: "Who Will Be There", subtitle: "xander."),
        StudyItem(title: "Gentle Nightfall", subtitle: "Pines, Tibeauthetraveler, HM Surf"),
        StudyItem(title: "You&Me", subtitle: "Sátyr, marsquake"),
        StudyItem(title: "ride in the park", subtitle: "chief."),
        StudyItem(title: "Homecoming", subtitle: "Showyou"),
        StudyItem(title: "After so Long", subtitle: "Swink"),
        StudyItem(title: "rememberance", subtitle: "Brxvs, Autuxn"),
        StudyItem(title: "Gambit", subtitle: "Blue Wednesday"),
        StudyItem(title: "Before Studying", subtitle: "Buttersweet"),
        StudyItem(title: "Until Next Time", subtitle: "Ornithology"),
        StudyItem(title: "Passengers", subtitle: "o k h o, Lester Nowhere"),
        StudyItem(title: "Stay", subtitle: "Yasper"),
        StudyItem(title: "where ocean meets sky", subtitle: "tonbo, azayaka"),
        StudyItem(title: "down by the docks", subtitle: "marsquake"),
        StudyItem(title: "Coincidences", subtitle: "Odd Panda, Copacetik"),
        StudyItem(title: "hold on", subtitle: "noni"),
        StudyItem(title: "New Priorities", subtitle: "C4C"),
        StudyItem(title: "Snowed In", subtitle: "Shrimpnose, Allem Iversom, chief."),
        StudyItem(title: "Summer Rain", subtitle: "Blue Wednesday"),
        StudyItem(title: "suspended in a sunbeam", subtitle: "tonbo, azayaka"),
        StudyItem(title: "Time Zones, Pt.1", subtitle: "takeo, juniorodeo"),
        StudyItem(title: "sunderland", subtitle: "weeboo"),
        StudyItem(title: "balcony", subtitle: "fnonose, morningtime"),
        StudyItem(title: "Pastel Palace", subtitle: "Mafia Princess"),
        StudyItem(title: "Karma", subtitle: "Danæ, marsquake"),
        StudyItem(title: "Stay A While", subtitle: "Elaquent, Joe Bae"),
        StudyItem(title: "Nag Champa", subtitle: "Leap Year"),
        StudyItem(title: "Morning Dew", subtitle: "Blue Wednesday"),
        StudyItem(title: "Everest", subtitle: "SYNC.EXE"),
        StudyItem(title: "windswept", subtitle: "marsquake"),
        StudyItem(title: "Card Games", subtitle: "azayaka"),
        StudyItem(title: "KOAN", subtitle: "YIIN"),
        StudyItem(title: "Night Connection", subtitle: "Swink"),
        StudyItem(title: "shadow pine", subtitle: "weeboo"),
        StudyItem(title: "Lake Loop", subtitle: "Enluv, azayaka"),
        StudyItem(title: "Youth", subtitle: "Ambullo, mell-ø"),
        StudyItem(title: "Lotus", subtitle: "marsquake, azayaka"),
        StudyItem(title: "Walking", subtitle: "Aso"),
        StudyItem(title: "Garden", subtitle: "Horace Maurice"),
        StudyItem(title: "Lamada's Wonder Cure", subtitle: "Mama Aiuto, Daphné"),
        StudyItem(title: "daily walk", subtitle: "Grisp, Hoffy Beats"),
        StudyItem(title: "Hopeful", subtitle: "Aiguille, Tah."),
        StudyItem(title: "Cottage in the Forest", subtitle: "Project AER, Komachi"),
        StudyItem(title: "Moonglade", subtitle: "GlobalDub"),
        StudyItem(title: "in the clouds", subtitle: "tonbo, azayaka"),
        StudyItem(title: "Ebb", subtitle: "Claptu, Rudi Montaire"),
        StudyItem(title: "return", subtitle: "noni"),
        StudyItem(title: "Celeste", subtitle: "NueBoo, Felty, Devon Rea"),
        StudyItem(title: "Brisk", subtitle: "SYNC.EXE, Early Garden"),
        StudyItem(title: "till we meet again (Grand Canyon)", subtitle: "wrongnumber, Arden Records"),
        StudyItem(title: "Nats Dream", subtitle: "NueBoo, Felty"),
        StudyItem(title: "Tidepool", subtitle: "mell-ø, Ambulo"),
        StudyItem(title: "Inhale, Exhale", subtitle: "brillion., HM Surf"),
    ]
}
