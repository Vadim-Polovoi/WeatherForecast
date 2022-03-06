//
//  TodayWeatherView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                Image(cityViewModel.getWeatherImageFor(icon: cityViewModel.weatherIcon)).resizable()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text(cityViewModel.temperature)
                        .font(.system(size: 42))
                    
                    Text(cityViewModel.conditions)
                }
            }
            
            HStack {
                Spacer()
                widgetView(image: "wind", color: ColorScheme.green, title: "\(cityViewModel.windSpeed)")
                Spacer()
                widgetView(image: "drop.fill", color: ColorScheme.blue, title: "\(cityViewModel.humidity)")
                Spacer()
                widgetView(image: "arrow.down.right.and.arrow.up.left", color: ColorScheme.purple, title: "\(cityViewModel.pressure)")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(ColorScheme.textColor)
        .background(RoundedRectangle(cornerRadius: 20).fill(ColorScheme.blueGradient))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(ColorScheme.white))
            
            Text(title)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
