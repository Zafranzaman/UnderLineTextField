//
//  ContentView.swift
//  UnderLineTextField
//
//  Created by Zafran on 19/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            CustomTextField(text: $username, icon: "person", placeholder: "Username", isSecure: false)
                .padding(.horizontal)
                .padding(.top, 50)
            
            CustomTextField(text: $password, icon: "lock", placeholder: "Password", isSecure: true)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
