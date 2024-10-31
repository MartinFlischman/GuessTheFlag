//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Martin on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    var correctAnswers = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    
                    Text(countries[correctAnswers])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
