//
//  weatherData.swift
//  Clima
//
//  Created by Syed Farhan on 10/07/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
    
}
struct Weather: Codable {
    let id: Int
}
