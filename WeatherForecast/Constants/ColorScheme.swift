//
//  Constants.swift
//  WeatherForecast
//
//  Created by Вадим on 5.03.22.
//

import Foundation
import SwiftUI


struct ColorScheme {
    static let textColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    static let opacityTextColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5))
    static let white = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    static let green = Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    static let blue = Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    static let purple = Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    static let yellow = Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
    static let opacityPurple = Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 0.6999948262))
    static let blueGradient = LinearGradient(
        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2038285525, green: 0.678160598, blue: 0.9036881057, alpha: 1)), Color(#colorLiteral(red: 0.15656457, green: 0.5209079938, blue: 0.6941399421, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let purpleGradient = LinearGradient(
        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

