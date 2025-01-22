//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

struct CreditView: View {
    
    @State private var randomNumber: Int = Int.random(in: 1..<3) // Correct range syntax
    
    private var randomImage: String {
        return "profile_\(randomNumber)"
    }
    
    var body: some View {
        VStack { // Wrap in a VStack to lay out elements vertically
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
                .padding(.vertical, 10)
            
            Text("Arul Jebaraj")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("IOS Developer")
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}


#Preview {
    CreditView()
}
