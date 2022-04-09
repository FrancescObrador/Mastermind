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
        
        HStack(alignment: .center){
            
            VStack{
                // Player' selected Colors
                HStack{
                    ForEach(game.temporalCombinationColors, id: \.self) { color in
                        CombinationDotView(viewModel: CombinationDotViewModel(color: color))
                    }
                }
                
                // Color Buttons
                HStack{
                    ForEach(MastermindViewModel.validColors, id: \.self) { color in
                        CombinationDotView(viewModel: CombinationDotViewModel(color: color))
                            .onTapGesture {
                                game.AddColor(color)
                            }
                    }
                }
            }
            
            //Spacer()
            
            VStack(){
                Button("⌫"){
                    game.RemoveLastAddedColor()
                }
                .frame(width: 75, height: 35)
                .background(.gray)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                
                Button("⮐"){
                    game.EnterCombination()
                }
                .frame(width: 75, height: 35)
                .background(.gray)
                .clipShape(Rectangle())
                .foregroundColor(.white)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(game: MastermindViewModel())
    }
}
