//
//  UnderLineTextField.swift
//  UnderLineTextField
//
//  Created by Zafran on 19/09/2024.
//



import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var icon: String
    var placeholder: String
    var isSecure: Bool // Passed externally to determine if the field should be secure initially
    
    @State private var isSecured: Bool // Internal state for toggling visibility
    @FocusState private var isFocused: Bool
    
    init(text: Binding<String>, icon: String, placeholder: String, isSecure: Bool) {
        self._text = text
        self.icon = icon
        self.placeholder = placeholder
        self.isSecure = isSecure
        self._isSecured = State(initialValue: isSecure) // Initialize with the passed value
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.accentColor)
                
                if isSecured {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.primary)
                } else {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.primary)
                }
                
                if isSecure {
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: isSecured ? "eye.slash" : "eye")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isFocused ? .gray : .gray)
                    .animation(.easeInOut(duration: 0.2), value: isFocused),
                alignment: .bottom
            )
        }
    }
}

struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
