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
           do{
               let data  = try JSONEncoder().encode(notes)
               let url = getDirectoryPath().appendingPathComponent("Notes")
               try data.write(to: url)
           }catch{
               
           }
        }
        func fetchNotes(){
            do{
              
                let url = getDirectoryPath().appendingPathComponent("Notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self,from: data)
              
            }catch{
                
            }
         }
        
        func deleteNotes(offsets:IndexSet){
            withAnimation{
                notes.remove(atOffsets: offsets)
                saveNotes()
            }
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
                          
                            saveNotes()
                            text = ""
                        }) {
                            Image(systemName: "plus.circle").font(.system(size: 30))
                                .foregroundColor(.accentColor)
                        }
                        .fixedSize().buttonStyle(PlainButtonStyle())
                    }
                   
                    
                    if notes.isEmpty {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Hello, world!")
                    } else {
                        
                        List {
                            ForEach(0..<notes.count, id: \.self) { i in
                                NavigationLink(destination: Details(note: notes[i], count: notes.count, index: i)) {
                                    
                                    HStack(alignment:.center){
                                        Capsule().frame(width: 2).foregroundColor(.accent)
                                        Text(notes[i].notes)// Assuming 'title' is a property of your 'Note' object
                                    }
                                }
                             
                            }.onDelete(perform: deleteNotes)
                        }
                    }
                 
                }.onAppear(){
                    fetchNotes();
                }
                .navigationTitle("Notes").font(.system(size: 12))
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
