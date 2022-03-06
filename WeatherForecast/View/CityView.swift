//
//  CityView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct CityView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                .shadow(radius: 0)
            TodayWeatherView(cityViewModel: cityViewModel)
                .padding()
            HourlyWeatherView(cityViewModel: cityViewModel)
            DailyWeatherView(cityViewModel: cityViewModel)
        }.padding(.bottom)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
