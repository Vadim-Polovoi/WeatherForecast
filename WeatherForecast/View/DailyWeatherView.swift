//
//  DailyWeatherView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct DailyWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ForEach(cityViewModel.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityViewModel.getDayFor(timestamp: weather.dt))
                .frame(maxWidth: 120, alignment: .leading)
            
            Spacer()
            
            Text("\(cityViewModel.getTempFor(temp: weather.temp.max)) | \(cityViewModel.getTempFor(temp: weather.temp.min))")
                .frame(maxWidth: 150, alignment: .center)
            
            Spacer()
            
            cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                .foregroundColor(ColorScheme.white)
        }
        .foregroundColor(ColorScheme.textColor)
        .padding(.horizontal)
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 10).fill(ColorScheme.blueGradient))
        .padding(.horizontal)
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
