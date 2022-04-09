//
//  BoardView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 2/4/22.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var game: MastermindViewModel
    
    var body: some View {
        VStack(alignment: .center){
            InformationView(game: game)
            
            ForEach(0 ..< game.board.count, id: \.self){ index in
                RowView(viewModel: game.board[index])
            }
            Spacer()
            InputView(game: game)
            Spacer()
        }
        .padding(.all)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let game =  MastermindViewModel()
 
        BoardView(game: game)
    }
}
