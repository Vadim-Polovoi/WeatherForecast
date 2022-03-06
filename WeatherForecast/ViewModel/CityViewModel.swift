//
//  CityViewViewModel.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI
import CoreLocation


final class CityViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    
    @Published var city: String = "Cupertino" {
        didSet {
            getLocation()
        }
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "clear sky"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return "Clear"
    }
    
    var windSpeed: String {
        return "\(String(format: "%.1f", weather.current.wind_speed)) m/s"
    }
    
    var humidity: String {
        return "\(String(weather.current.humidity))%"
    }
    
    var pressure: String {
        return "\(String(weather.current.pressure)) hPa"
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM dd"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return "\(Int(temp))°C"
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getWeatherImageFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "clear sky"
        case "01n":
            return "night clear sky"
        case "02d":
            return "few clouds"
        case "02n":
            return "night few clouds"
        case "03d", "03n":
            return "scattered clouds"
        case "04d", "04n":
            return "broken clouds"
        case "09d", "09n":
            return "shower rain"
        case "10d":
            return "rain"
        case "10n":
            return "night rain"
        case "11d", "11n":
            return "thunderstorm"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "mist"
        default:
            return "clear sky"
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
    
    private func getLocation() {
        let coder = CLGeocoder()
        coder.geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        let urlString: String
        if let coord = coord {
            urlString = API.getWeatherUrlFor(lat: coord.latitude, lon: coord.longitude)
        } else {
            urlString = API.getWeatherUrlFor(lat: 37.3323, lon: -122.0312)
        }
        getWeatherInternal(for: urlString)
    }
    
    private func getWeatherInternal(for urlString: String) {
        if let urlString = URL(string: urlString) {
            NetworkManager<WeatherResponse>.fetch(for: urlString) { (result) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
    }
}
