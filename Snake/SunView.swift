//
//  ContentView.swift
//  Snake
//
//  Created by Denis Denisov on 7/5/24.
//

import SwiftUI

struct SunView: View {
    private let rayCount = 12
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let center = CGPoint(x: width / 2, y: height / 2)
            let radius = size * 0.3
            
            let rayLength = size * 0.15
            let rayWidth = size * 0.02
            
            Path { path in
                path.addArc(
                    center: center,
                    radius: radius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: false
                )
            }
            .fill(
                RadialGradient(
                    colors: [.yellow, .orange],
                    center: .center,
                    startRadius: 0,
                    endRadius: radius
                )
            )
            
            ForEach(0..<rayCount, id: \.self) { index in
                Path { path in
                    let angle = Angle.degrees(Double(index) / Double(rayCount) * 360)
                    let rayStart = CGPoint(
                        x: center.x + CGFloat(cos(angle.radians)) * radius,
                        y: center.y + CGFloat(sin(angle.radians)) * radius
                    )
                    let rayEnd = CGPoint(
                        x: center.x + CGFloat(cos(angle.radians)) * (radius + rayLength),
                        y: center.y + CGFloat(sin(angle.radians)) * (radius + rayLength)
                    )
                    
                    path.move(to: rayStart)
                    path.addLine(to: rayEnd)
                }
                .stroke(Color.yellow, lineWidth: rayWidth)
            }
        }
    }
}




#Preview {
    SunView()
        .frame(width: 200, height: 200)
}
