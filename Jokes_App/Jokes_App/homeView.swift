//
//  homeView.swift
//  Jokes_App
//
//  Created by Adil Aman Mohammed on 8/22/24.
//

import SwiftUI

struct homeView: View {
    
    @State private var selectedJokeType: String = ""  // To store the selected joke type
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backGroundImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(1.0)
                
                VStack {
                    Text("Choose Type :")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(Color.primary)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        // Programming
                        NavigationLink(destination: jokeView(jokeType: "Programming")) {
                            Text("Programming")
                                .font(.body)
                                .bold()
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15.0)
                                .shadow(radius: 5)
                                .foregroundColor(.black)
                        }
                        
                        // Miscellaneous
                        NavigationLink(destination: jokeView(jokeType: "Miscellaneous")) {
                            Text("Miscellaneous")
                                .font(.body)
                                .bold()
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15.0)
                                .shadow(radius: 5)
                                .foregroundColor(.black)
                        }
                        
                        // Dark
                        NavigationLink(destination: jokeView(jokeType: "Dark")) {
                            Text("Dark")
                                .font(.body)
                                .bold()
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15.0)
                                .shadow(radius: 5)
                                .foregroundColor(.black)
                        }
                        
                        // Pun
                        NavigationLink(destination: jokeView(jokeType: "Pun")) {
                            Text("Pun")
                                .font(.body)
                                .bold()
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15.0)
                                .shadow(radius: 5)
                                .foregroundColor(.black)
                        }
                        
                        
                        
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    homeView()
}
