//
//  Details.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

struct Details: View {
    let note : Note
    let count: Int
    let index: Int
    var body: some View {
        VStack{
            HStack{
                Capsule().frame(height: 1)
                Image(systemName: "note")
                Capsule().frame(height: 1)
            }.foregroundColor(.accent)
            Spacer()
            ScrollView(.vertical){
                Text(note.notes).multilineTextAlignment(.center)
                
            }
            Spacer()
            HStack{
                Image(systemName: "gear").imageScale(.large)
                Spacer()
                Text("\(index+1) / \(count)")
                Spacer()
                Image(systemName: "info.circle").imageScale(.large)
            }.foregroundColor(.secondary)
        }.padding()
    }
}

#Preview {
    Details(note: Note(id: UUID(), notes: "String"), count: 0, index: 1)
}
