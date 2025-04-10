//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Jiazhen Luo on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💄","👀","🧠","🐔","🐣","☂️","🎂","🎱"]
    @State private var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
            Text("Remove Card")
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "minus.rectangle")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "plus.app")
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount,id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large )
        .font(.title)
    }
    
    
    struct CardView: View {
        
        @State private var isFaceUp = true
        let content : String
        var body: some View {
            
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                
                Group{
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                base.strokeBorder(lineWidth: 2)
                
            }.onTapGesture {
                print("tapped")
                isFaceUp.toggle()
            }
        }
    }
    
}
#Preview {
    ContentView()
}

