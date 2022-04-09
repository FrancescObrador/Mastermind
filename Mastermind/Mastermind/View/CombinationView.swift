//
//  CombinationView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct CombinationView: View {
    
    var combination : [CombinationDotViewModel]
    
    var body: some View {
        HStack(alignment: .center){
            ForEach(combination, id: \.self) { viewModel in
                CombinationDotView(viewModel: viewModel)
            }
        }
    }
}

struct CombinationView_Previews: PreviewProvider {
    static var previews: some View {
        let combination = [CombinationDotViewModel(color: .red),
                           CombinationDotViewModel(color: .green),
                           CombinationDotViewModel(color: .blue),
                           CombinationDotViewModel(color: .white)]
        
        CombinationView(combination: combination)
    }
}
