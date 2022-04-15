//
//  InformationView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct InformationView: View {
    
    @ObservedObject var game: MastermindViewModel
    
    var body: some View {
        
        VStack{
            Text("MASTERMIND GAME")
                .font(.title)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 0.75, x: 1, y: 1)
            
            HStack{
                Text(game.GetTurnsLeftText())
            }
            
        }
        .frame(alignment: .topLeading)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        let mm = MastermindViewModel()
        InformationView(game: mm)
    }
}
