//
//  GameLogic.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import Foundation
import SwiftUI


class gameLogic {
    
    //include set of tones for play and playback
    
    @State var gameOn = false
    @State var playerTurn = false
    @State var currentLevel = 0
    @State var totalSegments = 3
    @State var tempo = 1
    
    let colors = [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green,
        Color.purple,
        Color.orange,
        Color.white,
        Color.cyan,
        Color.pink,
        Color.indigo
    ]
    
    
    func gameLoop() {
        gameOn = true
        var flawless = true
        
        while flawless {
            
        }
        
    }
    
    /*
    func displayPattern() -> [Int] {
        var pattern: [Int] = []
        
    }
     
     
     func matchPattern(pattern: [Int]) -> Bool {
     
     }
     */
    
    func flash() {
        
    }
    
    
    
}



/*
func gameLoop(difficulty: [String]){
    var totalSegments = Int(difficulty[0])
    var level = Int(difficulty[1])
    var tempo = Double(difficulty[2])
    var flawless = true
    
    while flawless {
        displayPattern(level: level!, totalSegments: totalSegments!)
        
        
        
        matchPattern()
    }
}

func displayPattern(level: Int, totalSegments: Int) -> [Int]{
    var pattern: [Int] = []
    for x in 0..<totalSegments{
        pattern.append(Int.random(in: 0..<totalSegments))
    }
    return pattern
}

func matchPattern(pattern: [Int]) -> Bool{
    
}

func flash(){
    
}
*/
