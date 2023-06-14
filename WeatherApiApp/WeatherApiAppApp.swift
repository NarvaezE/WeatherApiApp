//
//  WeatherApiAppApp.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 10/06/23.
//

import SwiftUI

@main
struct WeatherApiAppApp: App {
    let dbManager = DBManager.shared

    var body: some Scene {
        WindowGroup {
            
            SplashScreen().environment(\.managedObjectContext, dbManager.managedObjectContext)
            
        }
    }
}

