//
//  PreviewView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI

struct PreviewView: View {
    
    var body: some View {
       
        VStack {
            
            if let image = UIImage(named: "BusIcon") {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.previewIconHeight)
            }
            
        }.appBackground()
    }
}

struct PreviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            PreviewView().preferredColorScheme($0)
        }
    }
}
