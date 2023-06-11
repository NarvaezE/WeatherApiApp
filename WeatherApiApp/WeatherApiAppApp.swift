//
//  WeatherApiAppApp.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 10/06/23.
//

import SwiftUI

@main
struct WeatherApiAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
