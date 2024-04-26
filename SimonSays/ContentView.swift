//
//  ContentView.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var settings = Settings();
    @State var settingsScreen = false
    
    @State private var gameLogic = GameLogic();
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                RadialGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        center: .bottom,
                        startRadius: 0,
                        endRadius: 500)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack 
                {
                    Text("Simon Says")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                    
                    //Simon Wheel
                    SimonWheel(settings: settings, logic: gameLogic)
                    
                    
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
        }
        .sheet(isPresented: $settingsScreen) {
            SettingsMenu(settings: settings)
        }
    }
    
    
    //logic functionality
    func displayPattern(level: Int) -> [Int] {
        
        
        return [0,0]
    }
    
}




#Preview {
    ContentView()
}
