//
//  ContentView.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/08.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import SwiftUI

let sampleGameSites = ["title","title","title","title","title","title"]


struct GameSelector: View {
    var body: some View {
        NavigationView {
            Form {
                List(sampleGameSites, id: \.self) { (content: String) in
                    NavigationLink(destination: GameView()) {
                        HStack {
                            Image("sample").resizable().renderingMode(.original).frame(width: 50, height: 50).cornerRadius(16)
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(content).font(.system(.title)).accentColor(.primary)
                                Text("https://www.google.com/").accentColor(.secondary)
                                Spacer()
                            }
                        }
                    }
                }
            }.navigationBarTitle("Select Game").navigationBarItems(trailing: Button(action: {print("tapped")}) {
                Image(systemName: "plus.circle")
            })
        }
    }
}

struct GameSelector_Previews: PreviewProvider {
    static var previews: some View {
        GameSelector()
    }
}
