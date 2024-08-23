//
//  Home.swift
//  Jokes_App
//
//  Created by Adil Aman Mohammed on 8/21/24.
//

import SwiftUI
import AVFoundation

struct splashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.9
    @State private var opacity = 0.8
    @State private var wingAnimation = false
    
    @State private var instantOffset = CGSize(width: -UIScreen.main.bounds.width, height: 0)  // Start off-screen to the left
    @State private var jokeOffset = CGSize(width: UIScreen.main.bounds.width, height: 0)  // Start off-screen to the right
    
    @State private var audioPlayer: AVAudioPlayer?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if isActive {
            homeView()
                .transition(.opacity) // Smooth fade transition
        } else {
            
            ZStack{
                
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
                                withAnimation(Animation.easeInOut(duration: 2.0).repeatCount(3, autoreverses: true)) {
                                    self.wingAnimation.toggle()
                                }
                                withAnimation(Animation.easeInOut(duration: 2.0).delay(1.5)) {
                                    self.size = 1.2
                                    self.opacity = 1.0
                                }
                            }
                        
                        Text("Get an Instant")
                            .font(.system(size: 17))
                            .bold()
                            .offset(instantOffset)  // Apply the offset
                            .onAppear() {
                                withAnimation(Animation.easeOut(duration: 0.5)) {
                                    self.instantOffset = .zero  // Move to center
                                }
                            }
                        
                        HStack {
                            Spacer().frame(width: 100) // Adds a small fixed space
                            Text("Joke")
                                .font(.title)
                                .bold()
                                .offset(jokeOffset)  // Apply the offset
                                .onAppear() {
                                    withAnimation(Animation.easeOut(duration: 1.0).delay(0.5)) {
                                        self.jokeOffset = .zero  // Move to its set position
                                    }
                                }
                        }
                    }
                    .scaleEffect(size)
                }
                .onAppear() {
                    playOpeningSound() // Play the opening sound
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
    
    // Function to play the opening sound
    func playOpeningSound() {
        let soundURL = Bundle.main.url(forResource: "openingSound", withExtension: "wav")
        
        guard let url = soundURL else {
            print("Failed to locate sound file.")
            return
        }

        do {
            // Configure the audio session
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)

            // Initialize and play the sound
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }

}

#Preview {
    splashScreenView()
}
