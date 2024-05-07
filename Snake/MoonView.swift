//
//  MoonView.swift
//  Snake
//
//  Created by Denis Denisov on 7/5/24.
//

import SwiftUI

struct MoonView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let center = CGPoint(x: width / 2, y: height / 2)
            let radius = size * 0.4
            
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
                    gradient: Gradient(colors: [.white, .gray]),
                    center: .center,
                    startRadius: 0,
                    endRadius: radius
                )
            )
        }
    }
}



#Preview {
    MoonView()
        .frame(width: 200, height: 200)
        .background(Color.black)
}
