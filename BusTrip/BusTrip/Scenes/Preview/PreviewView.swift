//
//  PreviewView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI
import PreviewSnapshots

struct PreviewView: View {
    
    var body: some View {
       
        VStack {
            
            if let image = UIImage(named: Constants.previewImage) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.previewIconHeight)
            }
            
        }.appBackground()
    }
}

// MARK: - Previews

struct PreviewViewColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            PreviewView().preferredColorScheme($0)
        }
    }
}

struct PreviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { _ in
            PreviewView()
        })
    }
}
