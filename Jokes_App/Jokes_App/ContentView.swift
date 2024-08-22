//
//  ContentView.swift
//  Jokes_App
//
//  Created by Adil Aman Mohammed on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var jokeText = "Click Button"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(jokeText)
            
            Spacer()
            
            Button {
                getJoke()
            } label: {
                Text("Get a Random Joke")
            }

        }
        .padding()
    }
    
    
    func getJoke() {
        
        Task{
            
            if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=single"){
                
                
                
                do{
                    
                    
                    // Making the API Call
                    let (data, _) = try await URLSession.shared.data(from: url)
                    
                    // Parsing the JSON data
                    let decoder = JSONDecoder()
                    
                    let joke = try decoder.decode(Joke.self, from: data)
                    
                    // Assign joke text to label
                     jokeText = joke.joke
                    
                    
                }
                catch{
                    
                    
                    print(error)
                    
                    
                }
                
                
                
                
                
            }
            
            
        }
        
        
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}
