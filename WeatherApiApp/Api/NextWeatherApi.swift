//
//  NextWeatherApi.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import Foundation
import CoreLocation

public final class NextWeatherApi: NSObject,ObservableObject{
    
    public let nWLocationManager = CLLocationManager()
    public var nWCompletionHandler: ((NextWeather) -> Void)?
    
    public override init(){
        super.init()
        nWLocationManager.delegate = self
    }
    
    public func loadForecastData(_ nWCompletionHandler: @escaping((NextWeather)->Void)) {
        self.nWCompletionHandler = nWCompletionHandler
        nWLocationManager.requestWhenInUseAuthorization()
        nWLocationManager.startUpdatingLocation()
    }
    
    private func getNextWeather(forCoordinates coordinates: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=f21a12b2de83b396596d5c02b41cd8ea&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard error == nil,let data = data else {return}
        
        if let response = try? JSONDecoder().decode(ForecastData.self, from: data){
            let nextWeather = NextWeather(response: response)
            print(nextWeather)
            self.nWCompletionHandler?(nextWeather)
        }else{
            print("err")
        }
        }.resume()
    }
}

extension NextWeatherApi: CLLocationManagerDelegate{
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else {return}
            
            getNextWeather(forCoordinates: location.coordinate)
            
            
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
