//
//  ResultView.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import SwiftUI

struct ResultView: View {
    var resultList : [ResultDotViewModel]

    let columns = [
        GridItem(.fixed(20)),
        GridItem(.fixed(20))
      ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0 ..< resultList.count, id: \.self) { index in
                ResultDotView(viewModel: resultList[index])
            }
        }
        .frame(width: 10, height: 10, alignment: .center)
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        let resultList = [ResultDotViewModel(result: .positioned),
                          ResultDotViewModel(result: .exist),
                          ResultDotViewModel(result: .exist),
                          ResultDotViewModel(result: .positioned)]
    
        ResultView(resultList: resultList)
    }
}
