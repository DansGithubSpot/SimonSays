//
//  ContentView.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI

struct Dif {
    var type: String
    var startLevel: Int
    var segmentcount: Int
    var tempo: Double
}


struct ContentView: View {
    
    @State private var settings = Settings();
    @State var settingsScreen = false
    
    var difficulties: [String : [String]] = [
        "Easy": ["3","3","1.5"],
        "Normal": ["4","3","1"],
        "Hard": ["6","5","0.8"],
        "Custom": ["","",""] //blank initialized array for tweaked custom difficulty
    ]
    
    var colors: [Color] = [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green,
        Color.purple,
        Color.orange,
        Color.cyan,
        Color.pink,
        Color.indigo
    ]
    
    

    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                //Simon Wheel
                SimonWheel(totalSegments: 5, colors: colors)
                
                
                HStack{
                    Spacer()
                    //play button
                    Button("Play", action: {})
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                        .background(.green)
                        .buttonStyle(.bordered)
                        .cornerRadius(5)
                        //.clipShape(.capsule)
                        //.frame(width: 100, height:60)
                    
                    Spacer()
                    //settings button
                    Button("Settings", action: {settingsScreen = true})
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                        .background(.black)
                        .buttonStyle(.bordered)
                        .cornerRadius(5)
                    
                    Spacer()
                }
                Spacer()
                Spacer()
            
            }
        }
        .sheet(isPresented: $settingsScreen) {
            SettingsMenu(settings: settings)
        }
    }
}




#Preview {
    ContentView()
}
