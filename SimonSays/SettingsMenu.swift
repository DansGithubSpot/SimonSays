//
//  SettingsMenu.swift
//  SimonSays
//
//  Created by Dan on 4/15/24.
//

import SwiftUI

struct SettingsMenu: View
{
    @Environment(\.dismiss) var dismiss
    
    let tempos: [Double] = [3.0, 2.0, 1.5, 1.0, 0.5]
    
    @Bindable var settings : Settings;
    
    // Difficulty presets
    let difficultySegmentPresets: [String : Int] = [
        Settings.difficulties[0]: 3,
        Settings.difficulties[1]: 4,
        Settings.difficulties[2]: 6,
        Settings.difficulties[3]: 3
    ]
    
    let difficultyStartLevelPresets: [String : Int] = [
        Settings.difficulties[0]: 3,
        Settings.difficulties[1]: 3,
        Settings.difficulties[2]: 5,
        Settings.difficulties[3]: 3
    ]
    
    let difficultyTempoPresets: [String : Double] = [
        Settings.difficulties[0]: 1.5,
        Settings.difficulties[1]: 1,
        Settings.difficulties[2]: 0.8,
        Settings.difficulties[3]: 1.5
    ]
    
    var body: some View
    {
        NavigationStack
        {
            Form
            {
                Section
                {
                    Picker("Difficulty", selection: $settings.difficulty)
                    {
                        ForEach(Settings.difficulties, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .onChange(of: settings.difficulty) {
                        settings.segments = difficultySegmentPresets[settings.difficulty]!
                        settings.startLevel = difficultyStartLevelPresets[settings.difficulty]!
                        settings.tempo = difficultyTempoPresets[settings.difficulty]!
                    }
                }
                
                Section("Custom Difficulty Settings")
                {
                    if settings.difficulty != "Custom"
                    {
                        HStack
                        {
                            Text("Starting Level")
                            Spacer()
                            Text("")
                        }
                        
                        HStack
                        {
                            Text("Segment Count")
                            Spacer()
                            Text("")
                        }
                        
                        HStack
                        {
                            Text("Tempo")
                            Spacer()
                        }
                    }
                    else
                    {
                        Stepper("Starting Level: \(settings.startLevel)", value: $settings.startLevel, in: 2...35)
                        Stepper("Segment Count: \(settings.segments)", value: $settings.segments, in: 3...9)
                        Picker("Tempo", selection: $settings.tempo)
                        {
                            ForEach(tempos, id: \.self)
                            {
                                Text(String($0))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Game Settings")
            .toolbar {
                Button("Exit")
                {
                    print("exit settings")
                    print("New Settings: \(settings.difficulty) - segments = \(settings.segments), startLevel = \(settings.startLevel), tempo = \(settings.tempo)")
                    dismiss()
                }
            }
        }
    }
}


#Preview
{
    SettingsMenu(settings: Settings())
}
