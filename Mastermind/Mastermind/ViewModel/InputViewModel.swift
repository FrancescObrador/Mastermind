//
//  InputViewModel.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 8/4/22.
//

import Foundation
import SwiftUI

class InputViewModel : ObservableObject {
    
    @Published var combinationDots: [CombinationDotViewModel] = []
    private(set) var currentIndex: Int = 0
    var combination: [Color] = []
    
    func AddColor(_ color: Color){
        if currentIndex < 4 {
            combination.append(color)
            combinationDots.append(CombinationDotViewModel(color: color))
            currentIndex += 1
        }
    }
    
    func RemoveLastAddedColor(){
        if currentIndex >= 1 {
            combinationDots.remove(at: currentIndex-1)
            currentIndex -= 1
        }
    }
}
