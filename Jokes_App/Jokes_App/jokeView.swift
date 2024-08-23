//
//  ContentView.swift
//  Jokes_App
//
//  Created by Adil Aman Mohammed on 8/20/24.
//

import SwiftUI
import UIKit  // Import UIKit to use haptic feedback

struct jokeView: View {
    
    var jokeType: String
    
    @State private var jokeText = "Loading joke..."
    
    var body: some View {
        ZStack {
            Image("backGroundImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(jokeText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)  // Ensure the text takes up the full width available within the white box
                    .fixedSize(horizontal: false, vertical: true)  // Prevent the text from expanding horizontally
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    triggerHapticFeedback()  // Trigger haptic feedback on button press
                    getJoke()
                } label: {
                    Text("Get Another Joke")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(maxWidth: 300)  // Reduce the width of the outer VStack to a maximum of 300 points
            .cornerRadius(15.0)
            
        }
        .navigationTitle(jokeType + " Jokes")  // Keep the title
        .navigationBarTitleDisplayMode(.inline)  // Set title display mode to inline
        .toolbar {
            ToolbarItem(placement: .principal) {  // Customize the title color
                Text(jokeType + " Jokes")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
            }
        }
        .onAppear {
            getJoke()
        }
    }
    
    func getJoke() {
        Task {
            let urlString = "https://v2.jokeapi.dev/joke/\(jokeType)?type=single"
            
            guard let url = URL(string: urlString) else {
                jokeText = "Invalid URL"
                return
            }
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    jokeText = "Failed to load joke. Please try again."
                    return
                }
                
                let decoder = JSONDecoder()
                let joke = try decoder.decode(Joke.self, from: data)
                
                jokeText = joke.joke
                
            } catch {
                jokeText = "Failed to load joke. Please try again."
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // Function to trigger haptic feedback
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

#Preview {
    jokeView(jokeType: "Programming")
}
