//
//  Home.swift
//  Jokes_App
//
//  Created by Adil Aman Mohammed on 8/21/24.
//

import SwiftUI

struct splashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var wingAnimation = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if isActive {
            jokeView()
                .transition(.opacity) // Smooth fade transition
        } else {
            VStack {
                VStack {
                    Image("homepageicon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .rotationEffect(.degrees(wingAnimation ? 15 : -15))
                        .offset(x: wingAnimation ? -10 : 10, y: 0)
                        .opacity(opacity)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(3, autoreverses: true)) {
                                self.wingAnimation.toggle()
                            }
                            withAnimation(Animation.easeInOut(duration: 2.0).delay(1.5)) {
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                        }
                    
                    Text("Get an Instant")
                        .font(.system(size: 15))
                    
                    HStack {
                        Spacer().frame(width: 100) // Adds a small fixed space
                        Text("Joke")
                            .font(.title)
                            .bold()
                            .italic() // Applies italic (Italian-style) font
                    }
                }
                .scaleEffect(size)
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    splashScreenView()
}
