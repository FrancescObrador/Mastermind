//
//  GameLogic.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 25/3/22.
//

import Foundation
import SwiftUI

class MastermindViewModel : ObservableObject {
    let maxTries = 6
    @Published private(set) var board = [RowViewModel].init(repeating: RowViewModel.dummy(), count: 6)
    private var tries: Int
    public static let validColors: [Color] = [.red, .green, .blue, .white]
    private var secret: [Color]
    
    private(set) var combinationIndex: Int = 0
    var temporalCombinationColors = [Color]()
    @Published var temporalCombination = [CombinationDotViewModel]()
    
    func AddColor(_ color: Color){
        if combinationIndex < 4 {
            temporalCombinationColors.append(color)
            temporalCombination.append(CombinationDotViewModel(color: color))
            combinationIndex += 1
        }
    }
    
    func RemoveLastAddedColor(){
        if combinationIndex >= 1 {
            temporalCombinationColors.remove(at: combinationIndex-1)
            temporalCombination.remove(at: combinationIndex-1)
            combinationIndex -= 1
        }
    }
    
    init(_ secret: [Color]? = nil)
    {
        self.secret = secret ?? MastermindViewModel.GetRandomCombination()
        self.tries = 0
    }
    
    func EnterCombination(){
        RegisterTry(Check(temporalCombinationColors))
    }
    
    func Check(_ combination: [Color]) -> Combination
    {
        guard !combination.isEmpty else {
            return Combination(colors: [], result: [])
        }
        
        var results = [Result]()
        var existingColors = [Color]()
        
        var tmpCombination: [Color?] = combination.map { $0 }
        
        for (index, color) in self.secret.enumerated()
        {
            guard color != tmpCombination[index] else {
                results.append(.positioned)
                tmpCombination[index] = nil
                existingColors.append(color)
                continue
            }
            
            guard let colorIndex = tmpCombination.firstIndex(of: color)
            else {
                continue
            }
            
            if existingColors.contains(color){
                continue
            }
            
            results.append(.exist)
            existingColors.append(color)
            tmpCombination[colorIndex] = nil
        }
        
        let result = Combination(colors: combination, result: results)
        
        return result
    }
    
    func GetTurnsLeft() -> String{
        return "You have " + String((maxTries-tries)) + " left."
    }
    
    private func RegisterTry(_ combination: Combination){
        board[tries].Update(combination)
        tries += 1

        temporalCombination.removeAll()
        temporalCombinationColors.removeAll()
        combinationIndex = 0
    }
    
}

private extension MastermindViewModel {
    
    static func GetRandomCombination() -> [Color]{
        
        var combination = [Color]()
        
        (0...3).forEach { _ in
            combination.append(self.validColors[Int.random(in: 0...3)])
        }
        return combination
    }
}
