//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        VStack{
            Text(title).textCase(.uppercase).font(.headline).foregroundColor(.accent)
            HStack{
                Capsule().frame(height: 1)
                Image(systemName: "note.text")
                Capsule().frame(height: 1)
            }.foregroundColor(.accent)
        }
       
    }
}

#Preview {
    HeaderView(title: "Info")
}
