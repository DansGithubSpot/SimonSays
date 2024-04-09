//
//  WheelSegment.swift
//  SimonSays
//
//  Created by Dan on 4/3/24.
//

import SwiftUI
import CoreGraphics

struct WheelSegment: Shape {
    var startAngle: Double
    var endAngle: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = CGFloat(250)//min(rect.width, rect.height)
        path.move(to: center)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: Angle(degrees: startAngle),
                    endAngle: Angle(degrees: endAngle),
                    clockwise: false)
        return path
    }
}

#Preview {
    WheelSegment(startAngle: -90, endAngle: 0)
}
