//
//  NextWeatherModel.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import Foundation

struct ForecastData: Decodable {
    let cnt: Int
    let list: [WeatherArray]
    let city: City
}
struct City: Decodable {
    let name: String
    let timezone: Int
}



struct WeatherArray: Decodable {
    let dt: Int
    let main: MainW
    let weather: [WeatherDat]
    let clouds: Cloudsss
    let wind: Windss

    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind
        case dtTxt = "dt_txt"
        case rain
    }
}

struct Cloudsss: Decodable {
    let all: Int
}

struct MainW: Decodable {
    let temp: Double
    let humidity: Int
}

struct Rain: Decodable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

struct WeatherDat: Decodable{
    let description:String
    let main:String
    let icon:String
}

struct Windss: Decodable {
    let speed: Double
}
