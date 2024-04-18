//
//  ButtonWheel.swift
//  SimonSays
//
//  Created by Dan on 4/10/24.
//

import SwiftUI

struct ButtonWheel: View {
    
    var totalSegments: Int?
    var colors: [Color]?
    
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
        //Text("Hello")
        
        GeometryReader { geo in
                
                ForEach(0..<totalSegments!, id: \.self) { index in
                    
                    
                    
                    
                    /*
                    Button {
                        sectionTapped(index)
                    } label: {
                        WheelSegment(startAngle: startAngles[index], endAngle: endAngles[index])
                            .fill(colors![index])
                        .stroke(Color.gray, lineWidth: 2)
                        //Text("Lol")
                    }
                     */
                    
                }
        }
    }
    
    func sectionTapped(_ number: Int) {
        selectedSegment = number
    }
}

#Preview {
    ButtonWheel(totalSegments: 3, colors: [
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
