//
//  RowView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct RowView: View {
    var viewModel: RowViewModel
    
    var body: some View {
        HStack{
            CombinationView(combination: viewModel.combinationDotViewModels)
                .padding(.leading)
            Spacer()
            ResultView(resultList: viewModel.resultDotViewModels)
                .padding(.trailing)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let combination = Combination(colors: [.green, .red, .blue, .white], result: [.positioned, .exist, .positioned])
        
        let rowViewModel = RowViewModel(combination: combination)
        
        RowView(viewModel: rowViewModel)
    }
}
