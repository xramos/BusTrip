//
//  BusTripApp.swift
//  BusTrip
//
//  Created by Xavier Ramos on 25/6/24.
//

import SwiftUI

@main
struct BusTripApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
