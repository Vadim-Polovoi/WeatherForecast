//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var cityViewModel = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                SearchHeaderView(cityViewModel: cityViewModel).padding()
                
                ScrollView(showsIndicators: false) {
                    CityView(cityViewModel: cityViewModel)
                }.padding(.top, 10)
            }.padding(.top, 40)
        }.background(ColorScheme.purpleGradient)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

