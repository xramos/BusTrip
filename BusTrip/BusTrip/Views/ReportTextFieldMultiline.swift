//
//  ReportTextFieldMultiline.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI

struct ReportTextFieldMultiline: View {
    
    let placeholder: String
    let helper: String
    let input: Binding<String>
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(placeholder)
                .fontWeight(.bold)
            
            TextField(helper, text: input, axis: .vertical)
                .keyboardType(.default)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .padding(Constants.padding)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
}

#Preview {
    ReportTextFieldMultiline(placeholder: "Description",
                             helper: "Please input description (max 200 chars)",
                             input: .constant(""))
}
