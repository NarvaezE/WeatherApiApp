//
//  CurrentWeatherVM.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 11/06/23.
//

import Foundation

class CurrentWeatherVM:ObservableObject{
    @Published var cityname : String = "City Nam"
    @Published var timezone : String = "00:00 __"
    @Published var date : String = "00/00/00"
    @Published var cloudsProb:String = "0 %"
    @Published var humidity:String = "0 %"
    @Published var windSpeed:String = "0 km/h"
    @Published var temperature : String = "__"
    @Published var weatherDescription : String = "__"
    @Published var weatherIcon:String = ""
    public let currentWCall: CurrentWeatherApi
    
    init(currentWCall:CurrentWeatherApi){
        self.currentWCall = currentWCall
    }
    
    func refresh(){
        currentWCall.loadCurrentWeather{weather in
            DispatchQueue.main.async {
                self.cityname = weather.city
                self.timezone = weather.timezone
                self.date = weather.date
                self.cloudsProb = "\(weather.clouds) %"
                self.windSpeed = "\(weather.wind) km/h"
                self.humidity = "\(weather.humidity) %"
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = weather.icon
            }
        }
    }
}

