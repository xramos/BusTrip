//
//  ReportTextField.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI

struct ReportTextField: View {
    
    @State var state: InputState = .empty
    
    @FocusState var isFocused: Bool
    
    let placeholder: String
    let input: Binding<String>
    let keyboardType: UIKeyboardType
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            TextField(placeholder, text: input)
                .focused($isFocused)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .onChange(of: isFocused) { _, _ in
                    
                    if isFocused {
                        
                        state = .focus
                        
                    } else {
                        
                        state = .empty
                    }
                }
        }
        .frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 4) .strokeBorder(state.validationColor, lineWidth: isFocused ? 2 : 1))
    }
}

#Preview {
    ReportTextField(placeholder: "Name:",
                    input: .constant(""),
                    keyboardType: .default)
}
