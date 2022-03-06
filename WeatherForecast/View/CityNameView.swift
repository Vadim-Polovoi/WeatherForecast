//
//  CityNameView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct CityNameView: View {
    
    let city: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                
                Text(date)
            }.foregroundColor(ColorScheme.textColor)
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
