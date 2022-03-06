//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import Foundation


struct WeatherResponse: Codable {
    let current: Weather
    let hourly: [Weather]
    let daily: [DailyWeather]
    
    static func empty() -> WeatherResponse {
        WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 48),
            daily: [DailyWeather](repeating: DailyWeather(), count: 8)
        )
    }
}
