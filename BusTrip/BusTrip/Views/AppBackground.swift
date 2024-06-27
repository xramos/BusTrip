//
//  AppBackground.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI

struct AppBackground<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(LinearGradient(colors: [Color.primaryBackground, Color.bright],
                                     startPoint: .top,
                                     endPoint: .bottom))
                .ignoresSafeArea()
            
            content
        }
    }
}

struct AppBackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        AppBackground {
            
            content
        }
    }
}

extension View {

    func appBackground() -> some View {
        
        self.modifier(AppBackgroundModifier())
    }
}
