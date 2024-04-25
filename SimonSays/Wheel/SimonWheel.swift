//
//  SimonWheel.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct SimonWheel: View {
    
    var totalSegments: Int?
    let colors: [Color] = [
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
    
    // Sound File Names
    var soundFiles: [String] = [
        "simonbeep_red",
        "simonbeep_blue",
        "simonbeep_yellow",
        "simonbeep_green",
        "simonbeep_purple",
        "simonbeep_orange",
        "simonbeep_cyan",
        "simonbeep_pink",
        "simonbeep_indigo"
    ]
    
    @State var playerTurn: Bool?
    @State var selectedSegment: Int?
    
    @State private var currentFillColors: [Color] = [
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
    
    private var startAngles: [Double] {
        var angles: [Double] = []
        var currentAngle = -90.0
        for _ in 0..<totalSegments! {
            angles.append(currentAngle)
            currentAngle += 360/Double(totalSegments!)
        }
        return angles
    }
    
    private var endAngles: [Double] {
        var angles: [Double] = []
        var currentAngle = -90.0
        for _ in 0..<totalSegments! {
            currentAngle += 360/Double(totalSegments!)
            angles.append(currentAngle)
        }
        return angles
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                //graft button logic from guesstheflag to here
                ForEach(0..<totalSegments!, id: \.self){index in
                    WheelSegment(startAngle: startAngles[index], endAngle: endAngles[index])
                        .fill(currentFillColors[index])
                        .stroke(Color.gray, lineWidth: 4)
                        .shadow(radius: 5)
                        .onTapGesture {
                            print("section \(index)")
                            self.playSound(index: index);
                            //put blink code here
                            //currentFillColors[index] = Color.black;
                            withAnimation {
                                
                            }
                            /*
                            if playerTurn! {
                                
                            }
                             */
                            //blink()
                        
                        }
                        
                }
                
                //make second wheel overlay for flashed sections
                
                Circle()
                    .foregroundColor(Color.gray)
                    .frame(width: geo.size.width / 5)
                    .shadow(radius: 5)
                
                /*Correct/Incorrect/Timer Light
                 Correct pattern flashes green once
                 Incorrect input flashes red a few times
                 Timer flashes white while player inputs pattern
                 */
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width/7)
                    .opacity(0.5)
            }
        }
    }
    
    func playSound(index: Int)
    {
        let url = Bundle.main.url(forResource: soundFiles[index], withExtension: "wav");
        
        // Do nothing if file does not exist
        guard url != nil else {
            return;
        }
        
        do
        {
            player = try AVAudioPlayer(contentsOf: url!);
            player?.play();
        }
        catch
        {
            print("Error in playing sound fx");
        }
    }
    
}




#Preview {
    SimonWheel(totalSegments: 8)
}
