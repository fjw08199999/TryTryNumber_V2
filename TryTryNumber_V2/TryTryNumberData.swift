//
//  TryTryNumberData.swift
//  TryTryNumber_V2
//
//  Created by fred fu on 2021/9/14.
//

import Foundation


enum randomNumber {
    case botNumbrt
    
    var Random: Int {
        switch self {
        case .botNumbrt:
            return Int.random(in: 1...100)
        }
    }
}


enum GameState {
    case start
    case win
    case lose
    case draw
    case none
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "It's a Draw!"
        case .none:
            return "Please Input Number"
        }
    }
}

