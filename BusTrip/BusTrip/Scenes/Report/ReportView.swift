//
//  ReportView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI

struct ReportView: View {
    
    @StateObject var viewModel: ReportViewModel = ReportViewModel()
    
    @State var showDatePicker: Bool = false
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: Constants.padding) {
                    
                    ReportTextField(placeholder: "Name:",
                                    helper: "Please input your name",
                                    input: $viewModel.nameInput,
                                    keyboardType: .default)
                    
                    ReportTextField(placeholder: "Surname:",
                                    helper: "Please input your surname",
                                    input: $viewModel.surnameInput,
                                    keyboardType: .default)
                    
                    ReportTextField(placeholder: "Email:",
                                    helper: "Please input your email",
                                    input: $viewModel.emailInput,
                                    keyboardType: .emailAddress)
                    
                    ReportTextField(placeholder: "Phone:",
                                    helper: "Please input your phone",
                                    input: $viewModel.phoneInput,
                                    keyboardType: .phonePad)
                    
                    ReportDatePicker(date: $viewModel.date,
                                     minimumDate: viewModel.minimumDate,
                                     maximumDate: viewModel.maximumDate)
                    .onChange(of: viewModel.date, { oldValue, newValue in
                        viewModel.updateDateString()
                    })
                    
                    ReportTextFieldMultiline(placeholder: "Description:",
                                             helper: "Please input description of the issue",
                                             input: $viewModel.reportDescription)
                }
            }
            
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

#Preview {
    ReportView()
}
