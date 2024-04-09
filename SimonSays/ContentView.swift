//
//  ContentView.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var difficulties: [String : [String]] = [
        "Easy": ["3","3","1.5"],
        "Normal": ["4","3","1"],
        "Hard": ["6","5","0.8"],
        "Custom": ["","",""] //blank initialized array for tweaked custom difficulty
    ]
    
    //implement user and scoring abilities
    
    @State var selectedDifficulty = "Easy"
    @State var totalSegments: Int?
    @State var level: Int?
    @State var tempo: Double?
    @State var playerTurn: Bool = false
    
    
    var colors = [
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
    
    
    
    var body: some View {
        VStack {
            
            
            HStack{
                //play button
                
                //settings button
            }
        }
        .padding()
    }
}


//Game Logic
func gameLoop(difficulty: String){
    var flawless = true
    
    while flawless {
        
    }
}

func displayPattern(level: Int, totalSegments: Int) -> [Int]{
    var pattern: [Int] = []
    for _ in 0..<level{
        
        pattern.append(Int.random(in: 0..<totalSegments))
    }
    return pattern
}

func matchPattern(pattern: [Int]) -> Bool{
    var position = 0
    
    while position != pattern.count {
        
        
        position += 1
    }
    
    return false //placeholder
}

//for center indicator
func flash(){
    
}

#Preview {
    ContentView()
}
