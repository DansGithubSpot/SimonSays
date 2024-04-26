//
//  Settings.swift
//  SimonSays
//
//  Created by Dan on 4/18/24.
//

import Foundation

@Observable
class Settings
{
    static let difficulties: [String] = ["Easy", "Medium", "Hard", "Custom"];
    
    var difficulty = "Easy";
    var tempo = 1.5;
    var segments = 3;
    var startLevel = 4;
}
