//
//  SettingsMenu.swift
//  SimonSays
//
//  Created by Dan on 4/15/24.
//

import SwiftUI

struct SettingsMenu: View {
    @Environment(\.dismiss) var dismiss
    
    let difficulties: [String] = ["Easy", "Medium", "Hard", "Custom"]
    let tempos: [Double] = [3.0, 2.0, 1.5, 1.0, 0.5]
    
    @State private var selDif = ""
    @State private var segments = 3
    @State private var tempo = 2.0
    @State private var startLevel = 4
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    //Text("Place Holder")
                    Picker("Difficulty", selection: $selDif) {
                        ForEach(difficulties, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                //Basic
                Section {
                    if selDif != "Custom" {
                        HStack {
                            Text("Starting Level")
                            Spacer()
                            Text("")
                        }
                        HStack{
                            Text("Segment Count")
                            Spacer()
                            Text("")
                        }
                        HStack {
                            Text("Tempo")
                            Spacer()
                        }
                    } else {
                        Stepper("Starting Level: \(startLevel)", value: $startLevel, in: 2...35)
                        Stepper("Segment Count: \(segments)", value: $segments, in: 3...9)
                        Picker("Tempo", selection: $tempo) {
                            ForEach(tempos, id: \.self) {
                                Text(String($0))
                            }
                        }
                    }
                }
                
                Section {
                    Button("Save Settings") {
                        print("saved settings")
                    }
                }
                
                }
                .navigationTitle("Game Settings")
                .toolbar {
                    Button("Exit") {
                        print("exit settings")
                        
                        dismiss()
                    }
                }
            }
        }
    

    
    
    }


#Preview {
    SettingsMenu()
}
