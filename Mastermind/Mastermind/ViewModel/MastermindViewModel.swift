//
//  GameLogic.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 25/3/22.
//

import Foundation
import SwiftUI

class MastermindViewModel : ObservableObject {
    
    public let maxTries = 12
    public static let combinationMaxCount = 4
    public static let validColors: [Color] = [.red, .mint, .blue, .yellow, .orange, .purple]
    
    // Observed vars
    @Published private(set) var board = [RowViewModel]()
    @Published var temporalCombination = [CombinationDotViewModel]()
    
    @Published var isGameOver = false
    public var gameOverText = ""
    
    private var tries: Int
    private var secret: [Color]
    
    @Published var temporalCombinationColors = [Color]()
    private(set) var combinationIndex: Int = 0
    
    init(_ secret: [Color]? = nil)
    {
        self.secret = secret ?? MastermindViewModel.GetRandomCombination()
        print(self.secret)
        self.tries = 0
    }
    
    func AddColor(_ color: Color){
        if combinationIndex < MastermindViewModel.combinationMaxCount {
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
    
    func EnterCombination(){
        
        guard temporalCombinationColors.count == MastermindViewModel.combinationMaxCount else {
            return
        }
        
        let combination = Check(temporalCombinationColors)
        
        RegisterTry(combination)
        
        if combination.result == [.positioned, .positioned, .positioned, .positioned] {
            // Game is won
            GameOver("You won the game!")
        }
        
        if GetTurnsLeft() == 0 {
            // Game is lost
            GameOver("Oh... You lost the game")
        }
    }
    
    func GameOver(_ text: String){
        gameOverText = text
        isGameOver = true
        tries = 0
        secret = MastermindViewModel.GetRandomCombination()
        print(secret)
        board.removeAll()
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
    
    func GetTurnsLeft() -> Int{
        return (maxTries - tries)
    }
    
    func GetTurnsLeftText() -> String{
        return "You have " + String(GetTurnsLeft()) + " turns left."
    }
    
    func RegisterTry(_ combination: Combination){
        board.append(RowViewModel(combination: combination))
        tries += 1
        
        temporalCombination.removeAll()
        temporalCombinationColors.removeAll()
        combinationIndex = 0
    }
    
}

private extension MastermindViewModel {
    
    static func GetRandomCombination() -> [Color]{
        
        var combination = [Color]()
        
        (0...MastermindViewModel.combinationMaxCount-1).forEach { _ in
            combination.append(self.validColors[Int.random(in: 0...MastermindViewModel.validColors.count-1)])
        }
        return combination
    }
}
