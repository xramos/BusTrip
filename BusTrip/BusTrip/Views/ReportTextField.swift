//
//  ReportTextField.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI

struct ReportTextField: View {
    
    let placeholder: String
    let helper: String
    let input: Binding<String>
    let keyboardType: UIKeyboardType
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            Text(placeholder)
                .fontWeight(.bold)
            
            TextField(helper, text: input)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .padding(Constants.padding)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
}

// MARK: - Previews

struct ReportTextField_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            ReportTextField(placeholder: "Name:",
                            helper: "Input your name",
                            input: .constant(""),
                            keyboardType: .default)
            .preferredColorScheme($0)
        }
    }
}
