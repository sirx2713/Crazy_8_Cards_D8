//
//  ContentView.swift
//  Crazy_8_Cards_D8
//
//  Created by Tafadzwa Alexander Razaro on 2024/02/29.
//

import SwiftUI

struct GameView: View {
    
    //Holds player cards
    @State var playerCard = "back"
    
    //Holds cpu cards
   @State var cpuCard = "back"
    
    //Shows player score
   @State var playerScore = 0
    
    //Shows cpu score
   @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
   
    
    func deal() {
        
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 1 to both if a tie
        else  if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
        
        //Add 4 to cpu
        if cpuCard > playerCard {
            cpuScore += 4
        }
    }
}

#Preview {
    GameView()
}
