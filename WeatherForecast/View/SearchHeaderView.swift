//
//  MenuHeaderView.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import SwiftUI


struct SearchHeaderView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
    
    @State private var searchTerm = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(ColorScheme.white)
            
            TextField("", text: $searchTerm)
                .placeholder(when: searchTerm.isEmpty) {
                    Text("Please enter a search city").foregroundColor(ColorScheme.opacityTextColor)
                }
            
            Button {
                cityViewModel.city = searchTerm
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(ColorScheme.opacityPurple)
                    
                    Image(systemName: "location.fill")
                        .foregroundColor(ColorScheme.white)
                }
            }
            .opacity(searchTerm == "" ? 0.5 : 1)
            .disabled(searchTerm == "")
            .frame(width: 50, height: 50)
        }
        .foregroundColor(ColorScheme.white)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(ColorScheme.blue)
        }
    }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
