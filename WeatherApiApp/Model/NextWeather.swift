//
//  NextWeather.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import Foundation

public struct NextWeather{
    let cnt:Int
    let list:[Listas]
    let name:String
    
    init(response: ForecastData){
        cnt = response.cnt
        list = response.list.map {listResponse in
            Listas(date:extractDateString(from:listResponse.dtTxt), timezone:extractTimeString(from: listResponse.dtTxt), temperature: "\(listResponse.main.temp)", clouds: "\(listResponse.clouds.all)", wind: "\(listResponse.wind.speed)", humidity: "\(listResponse.main.humidity)", description: listResponse.weather.first?.description ?? "", icon: listResponse.weather.first?.icon ?? "") }
        name = response.city.name
    }
    
    public struct Listas{
        let date:String
        let timezone:String
        let temperature:String
        let clouds:String
        let wind:String
        let humidity:String
        let description:String
        let icon:String
        
        init(date: String, timezone: String, temperature: String, clouds: String, wind: String, humidity: String, description: String, icon: String) {
            self.date = date
            self.timezone = timezone
            self.temperature = temperature
            self.clouds = clouds
            self.wind = wind
            self.humidity = humidity
            self.description = description
            self.icon = icon
        }
        
    }
    
}

func extractTimeString(from string: String) -> String {
    let components = string.components(separatedBy: " ")
    guard components.count > 1 else { return "" }
    return components.dropFirst().joined(separator: " ")
}

func extractDateString(from string: String) -> String {
    let components = string.components(separatedBy: " ")
    return components.first ?? ""
}
func formatSecondsToHour(seconds: Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    
    let date = Date(timeIntervalSince1970: TimeInterval(seconds))
    let formattedString = formatter.string(from: date)
    
    return formattedString
}
func convertToDates(timeZoneOffset: Int) -> String {
    let timezone = TimeZone(secondsFromGMT: timeZoneOffset)
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = timezone
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "EEEE, MMMM d"
    
    let currentDateTime = Date()
    let formattedDateTime = dateFormatter.string(from: currentDateTime)
    
    return formattedDateTime.capitalized
}
