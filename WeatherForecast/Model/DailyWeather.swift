//
//  DailyWeather.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import Foundation


struct DailyWeather: Codable, Identifiable {
    let dt: Int
    let temp: Temperature
    let weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}

