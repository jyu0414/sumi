//
//  ContentView.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/08.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import SwiftUI

let games = [
    Game(title: "Granblue Fantasy", icon: "gbf", path: URL(string: "http://mbga.jp/_game_launch?game_id=12016007")!)
]

struct GameSelector: View {
    var body: some View {
        NavigationView {
            Form {
                List(games, id: \.self) { (content: Game) in
                    GameSelectorCell(content: content)
                }
            }.navigationBarTitle("Select Game").navigationBarItems(trailing: Button(action: {print("tapped")}) {
                Image(systemName: "arrow.up.doc")
            })
        }
    }
}

struct GameSelectorCell: View {
    let content: Game
    var body: some View {
        NavigationLink(destination: GameView(game: content)) {
            HStack {
                Image(content.icon).resizable().renderingMode(.original).frame(width: 50, height: 50).cornerRadius(16)
                VStack(alignment: .leading) {
                    Spacer()
                    Text(content.title).font(.system(.headline)).accentColor(.primary)
                    Text(content.path.absoluteString).font(.system(.caption)).accentColor(.secondary)
                    Spacer()
                }
            }
        }
    }
    
}

struct GameSelector_Previews: PreviewProvider {
    static var previews: some View {
        GameSelector()
    }
}
