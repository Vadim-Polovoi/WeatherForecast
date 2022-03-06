//
//  API+Extensions.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import Foundation


extension API {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/"
    
    static func getWeatherUrlFor(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&units=metric&exclude=minutely&appid=\(key)"
    }
}
