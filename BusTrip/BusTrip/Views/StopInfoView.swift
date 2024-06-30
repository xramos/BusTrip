//
//  StopInfoView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 30/6/24.
//

import SwiftUI
import PreviewSnapshots

struct StopInfoView: View {
    
    var stop: StopDetail
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading) {
                
                Text(stop.address)
                    .font(.headline)
                
                HStack {
                    
                    Image(systemName: "calendar.circle")
                        .frame(height: Constants.iconHeight)
                        .foregroundColor(Color.secondary)
                    
                    Text(stop.stopTime.formatTime() ?? "")
                        .font(.footnote)
                }
            }
            .padding(Constants.padding)
            .background(Color.surface)
                   .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        }
    }
}

// MARK: - Previews

struct StopInfoView_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            StopInfoView(stop: StopDetail(id: 1,
                                          userName: "Bruce",
                                          price: 2,
                                          address: "Gotham",
                                          paid: true,
                                          stopTime: "2024-12-18T08:00:00.000Z",
                                          lat: 4.34,
                                          lon: 2.34))
            .preferredColorScheme($0)
        }
    }
}

struct StopInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
            
            StopInfoView(stop: StopDetail(id: 1,
                                          userName: "Bruce",
                                          price: 2,
                                          address: "Gotham",
                                          paid: true,
                                          stopTime: "2024-12-18T08:00:00.000Z",
                                          lat: 4.34,
                                          lon: 2.34))
        })
    }
}
