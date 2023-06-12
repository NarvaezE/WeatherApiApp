//
//  TabBar.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import SwiftUI

struct TabBar: View {
    @State private var index = "Weather"
        @Environment(\.managedObjectContext) private var vC
        
        var body: some View {
            TabView(selection: $index) {
                ContentView(currentWVM: CurrentWeatherVM(currentWCall: CurrentWeatherApi())).tabItem {
                    Label("History", systemImage: "list.bullet.clipboard")
                }.tag("Database")

                WeatherView(currentWVM: CurrentWeatherVM(currentWCall: CurrentWeatherApi()))
                .tabItem {
                    Label("Current Weather", systemImage: "cloud.fill")
                }.tag("Weather")
                
                Info()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }.tag("Info")
            }.accentColor(.white)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
