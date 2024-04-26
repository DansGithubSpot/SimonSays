//
//  GameLogic.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import Foundation
import SwiftUI

@Observable
class GameLogic
{
    public var pattern = [Int]();
    public var currentPatternIndex: Int = 0;
    public var isGameOver: Bool = false;
    public var hasWon: Bool = false;
    
    func createPattern(maxColorIndex: Int, patternLength: Int) -> [Int]
    {
        self.pattern.removeAll();
        
        for _ in 0..<patternLength
        {
            self.pattern.append(Int.random(in: 0..<maxColorIndex))
        }
        
        return self.pattern;
    }
    
    func incrementPatternIndex()
    {
        self.currentPatternIndex += 1;
    }
    
    func resetPatternIndex()
    {
        self.currentPatternIndex = 0;
    }
}
