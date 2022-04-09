//
//  MastermindTests.swift
//  MastermindTests
//
//  Created by Francesc Miquel Obrador Artigues on 25/3/22.
//

import XCTest
import SwiftUI
@testable import Mastermind

class MastermindTests: XCTestCase {

    
    func testGivenTheMatchIsCreted_ThenNoCombinationShouldBePresent() {
        let mastermind = MastermindViewModel();
        XCTAssertEqual(0, mastermind.board.count)
    }
    
    func testGivenACombination_ReturnsAResult(){
        
        let secret: [Color] = [.red, .blue, .red, .blue]
        
        let mastermind = MastermindViewModel(secret)
        
        let combination: [Color] = [.red, .red, .blue, .red]
        
        XCTAssertTrue(mastermind.Check(combination).result.contains(.exist))
    }
    
    func testGivenACombination_WhenCheckTwoExistingColorsInWrongPosition_ThenShouldGetTwoExist(){
        
        let secret: [Color] = [.blue, .red, .blue, .white]
        
        let mastermind = MastermindViewModel(secret)
        
        let combination: [Color] = [.red, .blue, .red, .blue]
        
        let obtainedResult = mastermind.Check(combination).result
        let expectedResult: [Result] = [.exist, .exist]
        
        XCTAssertEqual(obtainedResult, expectedResult)
    }
    
    func testGivenTheSameCombination_WhenCheckReturnsFourPositioned(){
        
        let secret: [Color] = [.blue, .white, .blue, .white]
        
        let mastermind = MastermindViewModel(secret)
        
        let combination: [Color] = [.blue, .white, .blue, .white]
        
        let obtainedResult = mastermind.Check(combination).result
        let expectedResult: [Result] = [.positioned, .positioned, .positioned, .positioned]
        
        XCTAssertEqual(obtainedResult, expectedResult)
    }
    
    func testGivenSeveralChecks(){
        
        let secret: [Color] = [.blue, .red, .white, .blue]
        
        let mastermind = MastermindViewModel(secret)
        
        var combination: [Color] = [.blue, .white, .blue, .green]
        
        XCTAssertEqual(mastermind.Check(combination).result, [.positioned, .exist])
        
        combination = [.blue, .blue, .red, .green]
        
        XCTAssertEqual(mastermind.Check(combination).result, [.positioned, .exist])
        
        combination = [.white, .blue, .red, .white]
        
        XCTAssertEqual(mastermind.Check(combination).result, [.exist, .exist, .exist])
        
        print(mastermind.board)
    }
    
    func testInput(){
        let input = InputViewModel()
        //let mastermind = MastermindViewModel()
        
        input.AddColor(.red)
        XCTAssertEqual(input.combination, [.red])
        XCTAssertEqual(input.currentIndex, 1)
    }

}
