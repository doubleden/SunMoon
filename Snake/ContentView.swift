//
//  ContentView.swift
//  Snake
//
//  Created by Denis Denisov on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDay = true
    @State private var isButtonDisabled = false
    
    @State private var sunPosition = 0.0
    @State private var moonPosition = -400.0
    
    var body: some View {
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
    }
    
    private func startAnimation() {
        isButtonDisabled.toggle()
        
        withAnimation(.easeInOut(duration: 2)) {
            isDay.toggle()
            if isDay {
                sunPosition = 0
                moonPosition = 400
            } else {
                moonPosition = 0
                sunPosition = 400
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if isDay {
                moonPosition = -400
            } else {
                sunPosition = -400
            }
            isButtonDisabled.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

