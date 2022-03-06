//
//  HourlyWeatherView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct HourlyWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -20) {
                ForEach(cityViewModel.weather.hourly) { weather in
                    let icon = cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityViewModel.getTimeFor(timestamp: weather.dt)
                    let temp = cityViewModel.getTempFor(temp: weather.temp)
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 10) {
            Text(hour)
            
            image
                .foregroundColor(ColorScheme.yellow)
            
            Text(temp)
        }
        .foregroundColor(ColorScheme.textColor)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(ColorScheme.blueGradient))
        .padding(.horizontal)
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
