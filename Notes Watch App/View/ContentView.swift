//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

    struct ContentView: View {
        @State private var text: String = ""
        @State private var notes:[Note]=[Note]()
        
        
        func getDirectoryPath() -> URL{
            let path=FileManager.default.urls(for:.documentDirectory,in: .userDomainMask)
            return path[0]
        }
        
       func saveNotes(){
            
        }

        var body: some View {
            NavigationStack {
                VStack {
                    HStack {
                        TextField("Enter Notes...", text: $text)
                            .padding()
                        Button(action: {
                            guard text.isEmpty == false else{return }
                        
                            let note = Note(id: UUID(), notes: text)
                            notes.append(note)
                            text = ""
                            saveNotes()
                        }) {
                            Image(systemName: "plus.circle").font(.system(size: 40))
                                .foregroundColor(.accentColor)
                        }
                        .fixedSize().buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                    
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .navigationTitle("Notes")
            }
            
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


#Preview {
    ContentView()
}
