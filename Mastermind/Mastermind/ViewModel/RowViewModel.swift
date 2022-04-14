//
//  RowViewModel.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import Foundation
import SwiftUI

class RowViewModel {
    
    var combinationDotViewModels: [CombinationDotViewModel]
    var resultDotViewModels: [ResultDotViewModel]
    
    init(combination: Combination){
        self.combinationDotViewModels = [CombinationDotViewModel]()
        self.resultDotViewModels = [ResultDotViewModel]()
        
        Update(combination)
        
    }
    
    func Update(_ combination: Combination){
        combination.colors.forEach{color in
            combinationDotViewModels.append(CombinationDotViewModel(color: color))
        }
        
        combination.result.forEach{ result in
            resultDotViewModels.append(ResultDotViewModel(result: result))
        }
    }
}

extension RowViewModel {
    static func dummy() -> RowViewModel {
        return RowViewModel(combination: Combination(colors: [], result: []))
    }
}
