//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Jiazhen Luo on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
