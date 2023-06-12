//
//  CurrentWeatherApiCall.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import CoreLocation
import Foundation

public final class CurrentWeatherApi: NSObject,ObservableObject {
    
    public let cWLocationManager = CLLocationManager()
    public var cWCompletionHandler: ((CurrentWeather) -> Void)?
    
    public override init(){
        super.init()
        cWLocationManager.delegate = self
    }
    
    public func loadCurrentWeather(_ cWCompletionHandler: @escaping((CurrentWeather)->Void)) {
        self.cWCompletionHandler = cWCompletionHandler
        cWLocationManager.requestWhenInUseAuthorization()
        cWLocationManager.startUpdatingLocation()
    }
    
    private func currentWeatherCall(forCoordinates coordinates: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=f21a12b2de83b396596d5c02b41cd8ea&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard error == nil,let data = data else {return}
        
        
        if let response = try? JSONDecoder().decode(CurrentW.self, from: data){
            let currWeather = CurrentWeather(response: response)
            self.cWCompletionHandler?(currWeather)
            print(currWeather)
        }else{
            print("error")
        }
        }.resume()
    }
}

extension CurrentWeatherApi: CLLocationManagerDelegate{
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else {return}
            currentWeatherCall(forCoordinates: location.coordinate)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}



