//
//  ContentView.swift
//  Snake
//
//  Created by Denis Denisov on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDay = true
    @State private var sunPosition = 0.0
    @State private var moonPosition = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                Color(isDay ? .blue : .black).ignoresSafeArea()
                
                SunView()
                    .frame(width: 200, height: 200)
                    .offset(x: sunPosition, y: 0)
                    .opacity(isDay ? 1 : 0)
                
                MoonView()
                    .frame(width: 200, height: 200)
                    .offset(x: moonPosition, y: 0)
                    .opacity(isDay ? 0 : 1)
            }
            
            Button(isDay ? "Go sleep" : "Wake Up") {
                withAnimation(.easeInOut(duration: 1)) {
                    isDay.toggle()
                    if isDay {
                        sunPosition = 0
                        moonPosition = 0 + 100
                        
                    } else {
                        moonPosition = 0
                        sunPosition = 0 + 100
                    }
                }
                if isDay {
                    moonPosition = -width / 2 - 100
                } else {
                    sunPosition = -width / 2 - 100
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(width: width, height: height, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

