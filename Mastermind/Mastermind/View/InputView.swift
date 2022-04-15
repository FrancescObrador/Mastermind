//
//  InputView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 7/4/22.
//

import SwiftUI

struct InputView: View {
    
    @ObservedObject var game: MastermindViewModel
    
    var body: some View {
        
        HStack(alignment: .bottom){
            
            VStack{
                // Player' selected Colors
                HStack{
                    ForEach(game.temporalCombinationColors, id: \.self) { color in
                        CombinationDotView(viewModel: CombinationDotViewModel(color: color, size: CGSize(width: 30, height: 30)))
                    }
                }
                
                // Color Buttons
                HStack(alignment: .bottom){
                    ForEach(MastermindViewModel.validColors, id: \.self) { color in
                        CombinationDotView(viewModel: CombinationDotViewModel(color: color, size: CGSize(width: 30, height: 30)))
                            .onTapGesture {
                                game.AddColor(color)
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            
            VStack(alignment: .leading){
                Button("⌫"){
                    game.RemoveLastAddedColor()
                }
                .frame(width: 65, height: 35)
                .background(.gray)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                
                Button("⮐"){
                    game.EnterCombination()
                }
                .frame(width: 65, height: 35)
                .background(.gray)
                .clipShape(Rectangle())
                .foregroundColor(.white)
            }
            .padding(.trailing)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(game: MastermindViewModel())
    }
}
