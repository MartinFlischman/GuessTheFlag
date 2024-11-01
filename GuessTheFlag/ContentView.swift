//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Martin on 2024/10/30.
//

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Martin on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    @State private var questionCount = 1
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: .gray, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(Color(red: 0.1, green: 0.2, blue: 0.45))
                            .font(.subheadline.weight(.semibold))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(Color(red: 0.1, green: 0.2, blue: 0.45))
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(playerScore)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(playerScore)")
        }
        .alert("Game Over!", isPresented: $gameOver) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your final score was \(playerScore) out of 8")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            playerScore += 1
            scoreTitle = "Correct! "
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
            playerScore -= 1
        }
        
        if questionCount == 8 {
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount += 1
    }
    
    func resetGame() {
        questionCount = 1
        playerScore = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
