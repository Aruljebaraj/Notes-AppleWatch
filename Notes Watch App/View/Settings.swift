//
//  Settings.swift
//  Notes Watch App
//
//  Created by Arul on 22/01/25.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        
        HeaderView(title: "Settings")
            .padding(.vertical, 10)
        
        Text("Arul Jebaraj")
            .foregroundColor(.primary)
            .fontWeight(.bold)
        
        Text("IOS Developer")
            .foregroundColor(.secondary)
            .fontWeight(.light)
    }
}

#Preview {
    Settings()
}
