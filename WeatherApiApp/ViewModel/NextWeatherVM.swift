//
//  NextWeatherVM.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 11/06/23.
//

import Foundation

class NextWeatherVM: NSObject, ObservableObject {
    @Published var forecast: NextWeather?
    
    private let nextWCall: NextWeatherApi
    
    override init() {
        nextWCall = NextWeatherApi()
        super.init()
        nextWCall.loadForecastData { [weak self] forecast in
            DispatchQueue.main.async {
                self?.forecast = forecast
            }
        }
    }
}
