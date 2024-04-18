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
        //var path = Path()
        Path { path in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = CGFloat(250)//min(rect.width, rect.height)
            let midCenter = CGPoint(
                x: radius/2 * cos((startAngle+endAngle)/2),
                y: radius/2 * sin((startAngle+endAngle)/2)
            )
            path.move(to: center)
            path.addArc(center: center,
                        radius: radius,
                        startAngle: Angle(degrees: startAngle),
                        endAngle: Angle(degrees: endAngle),
                        clockwise: false)
            path.addLine(to: center)
            path.move(to: midCenter)
        }
        //return path
    }

}

#Preview {
    WheelSegment(startAngle: -90, endAngle: 0)
}
