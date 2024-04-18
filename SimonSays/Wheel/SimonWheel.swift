//
//  SimonWheel.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI

struct SimonWheel: View {
    
    var totalSegments: Int?
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
    
    @State var playerTurn: Bool?
    @State var selectedSegment: Int?
    
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
                        .fill(colors[index])
                        .stroke(Color.gray, lineWidth: 4)
                        .shadow(radius: 5)
                        .onTapGesture {
                            print("section \(index)")
                            withAnimation(.easeOut) {
                                
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
    
    
}




#Preview {
    SimonWheel(totalSegments: 8, colors: [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green,
        Color.purple,
        Color.orange,
        Color.cyan,
        Color.pink,
        Color.indigo
    ]/*.shuffled()*/)
}
