//
//  CombinationDotViewModel.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import Foundation
import SwiftUI

final class CombinationDotViewModel : ObservableObject, Hashable{

    @Published private(set) var color: Color = .red
    @Published private(set) var size: CGSize
    
    static func == (lhs: CombinationDotViewModel, rhs: CombinationDotViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        color.hash(into: &hasher)
    }
    
    init(color: Color, size: CGSize = CGSize(width: 35, height: 35)){
        self.color = color
        self.size = size
    }
}
