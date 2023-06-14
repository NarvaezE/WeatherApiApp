//
//  CurrentWeather.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import Foundation

public struct CurrentWeather{
    let city:String
    let timezone: String
    let date: String
    let clouds:String
    let wind:String
    let humidity:String
    let temperature:String
    let description:String
    let icon:String
    let iconMain:String
    
    init(response:CurrentW){
        city = response.name
        timezone = formatSecondsToHours(seconds: response.timezone)
        date = convertToDate(timeZoneOffset: response.timezone)
        clouds = "\(Int(response.clouds.all)) "
        wind = "\(response.wind.speed)"
        humidity = "\(response.main.humidity)"
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        icon = response.weather.first?.icon ?? ""
        iconMain = response.weather.first?.iconMain ?? ""
    }
}

func formatSecondsToHours(seconds: Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    
    let date = Date(timeIntervalSince1970: TimeInterval(seconds))
    let formattedString = formatter.string(from: date)
    
    return formattedString
}
func convertToDate(timeZoneOffset: Int) -> String {
    let timezone = TimeZone(secondsFromGMT: timeZoneOffset)
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = timezone
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "EEEE, MMMM d "
    
    let currentDateTime = Date()
    let formattedDateTime = dateFormatter.string(from: currentDateTime)
    
    return formattedDateTime.capitalized
}
