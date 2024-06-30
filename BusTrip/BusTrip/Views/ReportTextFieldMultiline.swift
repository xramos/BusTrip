//
//  ReportTextFieldMultiline.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI
import PreviewSnapshots

struct ReportTextFieldMultiline: View {
    
    let placeholder: String
    let helper: String
    let input: Binding<String>
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(placeholder)
                .fontWeight(.bold)
            
            TextField(helper, text: input, axis: .vertical)
                .tint(Color.surfaceSelected)
                .keyboardType(.default)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .padding(Constants.padding)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
}

// MARK: - Previews

struct ReportTextFieldMultiline_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            ReportTextFieldMultiline(placeholder: "Description",
                                     helper: "Please input description (max 200 chars)",
                                     input: .constant(""))
            .preferredColorScheme($0)
        }
    }
}

struct ReportTextFieldMultiline_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
            
            ReportTextFieldMultiline(placeholder: "Description",
                                     helper: "Please input description (max 200 chars)",
                                     input: .constant(""))
        })
    }
}
