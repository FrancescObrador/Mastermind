//
//  Combination.swift
//  Mastermind
//
//  Created by Francesc Miquel Obrador Artigues on 25/3/22.
//

import Foundation
import SwiftUI

enum Result {
    case exist, positioned, none
}

struct Combination {
    let colors: [Color]
    let result: [Result]
}
