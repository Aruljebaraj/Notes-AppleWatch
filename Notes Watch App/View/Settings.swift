//
//  Settings.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

struct Settings: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value : Float = 1.0
    
    
    func updateLineCount(){
        lineCount = Int(value)
    }
    var body: some View {
        VStack{
            HeaderView(title: "Settings")
                .padding(.vertical, 10)
            Text("Lines :\(lineCount)".uppercased())
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.updateLineCount()
                
            }),in: 1...4,step: 1).accentColor(.accent)
        }
        
       
//        
//        Text("Arul Jebaraj")
//            .foregroundColor(.primary)
//            .fontWeight(.bold)
//        
//        Text("IOS Developer")
//            .foregroundColor(.secondary)
//            .fontWeight(.light)
    }
}

#Preview {
    Settings()
}
