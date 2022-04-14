//
//  RedDotViewModel.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 1/4/22.
//

import Foundation
import SwiftUI

final class ResultDotViewModel : ObservableObject, Hashable{

    @Published private(set) var color: Color = .red
    @Published private(set) var size: CGSize
    
    private var result: Result
    
    static func == (lhs: ResultDotViewModel, rhs: ResultDotViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        color.hash(into: &hasher)
    }
    
    init(result: Result, size: CGSize? = nil){
        self.result = result
        self.size = size ?? CGSize(width: 15, height: 15)
        self.color = self.result == .exist ? .black: .red
    }
}
