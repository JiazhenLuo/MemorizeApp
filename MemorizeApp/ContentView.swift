//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Jiazhen Luo on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💄","👀","🧠","🐔"]

    var body: some View {
        HStack{
            ForEach(emojis.indices,id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
