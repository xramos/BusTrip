//
//  BusTripApp.swift
//  BusTrip
//
//  Created by Xavier Ramos on 25/6/24.
//

import SwiftUI

@main
struct BusTripApp: App {
    
    @State var inactive = false
    
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        
        WindowGroup {
            
            ZStack {
                
                NavigationView {
                    
                    TripListView()
                        .opacity(inactive ? 0 : 1)
                }
                
                PreviewView()
                    .opacity(inactive ? 1 : 0)
            }
        }
        .onChange(of: scenePhase) { oldScenePhase, newScenePhase in
            
            switch newScenePhase {
            case .active:
                DispatchQueue.main.async {
                    inactive = false
                }
            case .background, .inactive:
                DispatchQueue.main.async {
                    inactive = true
                }
            @unknown default:
                print("Apple must have added something new!")
            }
        }
    }
}
