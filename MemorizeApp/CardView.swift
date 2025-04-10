//
//  CardView.swift
//  MemorizeApp
//
//  Created by Jiazhen Luo on 4/10/25.
//

import SwiftUI

struct CardView: View {
    
    @State private var isFaceUp = true
    
    var body: some View {
        
        ZStack {
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp{
                base.foregroundColor(.white)
                
                base.strokeBorder(lineWidth: 2)
                Text("🦷").font(.largeTitle)
            } else{
                base.fill()
            }
        }.onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView()
}
