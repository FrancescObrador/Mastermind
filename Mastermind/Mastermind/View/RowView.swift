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
            CombinationView(combination: viewModel.combinationDotViewModels )
            ResultView(resultList: viewModel.resultDotViewModels )
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let combination = Combination(colors: [.green, .green, .blue, .white], result: [.positioned, .exist, .positioned])
        
        let rowViewModel = RowViewModel(combination: combination)
        
        RowView(viewModel: rowViewModel)
    }
}
