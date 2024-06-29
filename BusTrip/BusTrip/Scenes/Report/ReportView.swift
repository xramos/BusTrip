//
//  ReportView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI

struct ReportView: View {
    
    @StateObject var viewModel: ReportViewModel = ReportViewModel()
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    ReportTextField(placeholder: "Name:",
                                    input: $viewModel.nameInput,
                                    keyboardType: .default)
                    
                    ReportTextField(placeholder: "Surname:",
                                    input: $viewModel.surnameInput,
                                    keyboardType: .default)
                    
                    ReportTextField(placeholder: "Email:",
                                    input: $viewModel.emailInput,
                                    keyboardType: .emailAddress)
                    
                    ReportTextField(placeholder: "Phone:",
                                    input: $viewModel.phoneInput,
                                    keyboardType: .phonePad)
                    
                    // Date Time
                    
                    // Description
                }
                .padding(Constants.padding)
                .background(Color.surface)
                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                
                Spacer()
                
                Button("Save") {
                    
                    viewModel.saveReport()
                }
                .disabled(viewModel.isSaveButtonDisabled())
                .padding(Constants.padding)
                .frame(maxWidth: .infinity)
                .background(Color.surface)
                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
            }
            .padding(Constants.paddingL)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryBackground)
        }
    }
}

#Preview {
    ReportView()
}
