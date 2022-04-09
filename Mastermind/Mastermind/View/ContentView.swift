//
//  ContentView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 25/3/22.
//

import SwiftUI

struct ContentView: View {

    var mastermind = MastermindViewModel()
    var body: some View {
        BoardView(game: mastermind)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
