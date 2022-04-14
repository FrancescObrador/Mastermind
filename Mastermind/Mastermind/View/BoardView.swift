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
        VStack(){
            
            InformationView(game: game)
            
            ScrollView(.vertical){
                ScrollViewReader { value in
                    ForEach(0 ..< game.board.count, id: \.self){ index in
                        RowView(viewModel: game.board[index])
                    }
                    .onChange(of: game.board.count) { _ in
                        value.scrollTo(game.board.count - 1)
                    }
                }
            }
            
            Spacer()
            
            InputView(game: game)
            
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let game =  MastermindViewModel()
        
        BoardView(game: game)
    }
}
