//
//  EmptyDataView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 28/6/24.
//

import SwiftUI

struct EmptyDataView: ViewModifier {
    
    let condition: Bool
    let message: String
    
    func body(content: Content) -> some View {
        valideView(content: content)
    }
    
    @ViewBuilder
    private func valideView(content: Content) -> some View {
        
        if condition {
            
            VStack{
                
                Spacer()
                
                Text(message)
                    .font(.headline)
                    .padding(Constants.paddingXL)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
        } else {
            
            content
        }
    }
}

extension View {
    
    func onEmpty(for condition: Bool, with message: String) -> some View {
        
        self.modifier(EmptyDataView(condition: condition,
                                    message: message))
    }
}
