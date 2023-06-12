//
//  CurrentWeatherModel.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import Foundation

struct CurrentW:Decodable{
    let name:String
    let timezone:Int
    let wind:Winds
    let clouds:Cloud
    let main: Main
    let weather:[Weather]
}

struct Winds:Decodable{
    let speed:Double
}
struct Cloud:Decodable{
    let all:Double
}
struct Main:Decodable{
    let temp: Double
    let humidity:Int
}

struct Weather : Decodable{
    let description:String
    let icon:String
    
}
