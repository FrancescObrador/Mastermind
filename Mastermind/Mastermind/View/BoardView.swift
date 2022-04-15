//
//  BoardView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 2/4/22.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var game: MastermindViewModel
    @State var start = true
    
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
        .popover(isPresented: $game.isGameOver, arrowEdge: .bottom) {
            Text(game.gameOverText)
        }
        .popover(isPresented: $start, arrowEdge: .bottom) {
            Text("Welcome to Mastermind! \n \n Press the colors of the bottom to make a combination and check it with the bottom button or remove the lattest with the upper button. \n \n Swipe down this popover to start the game.")
                .multilineTextAlignment(.center)
                .padding(.all)
        }
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        let game =  MastermindViewModel()
        
        BoardView(game: game)
    }
}
