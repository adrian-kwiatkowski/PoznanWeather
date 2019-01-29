//
//  WeatherData.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation
import UIKit

struct APIResponse: Codable {
    let list: [WeatherData]
}

struct WeatherData: Codable {
    let dt: Int
    let dateString: String?
    let temp: Temperature
    let pressure: Float
    let humidity: Int
    let weather: [Weather]
    let speed: Float
    let deg: Int
    
    struct Temperature: Codable {
        let day: Float
        let min: Float
        let max: Float
    }
    
    struct Weather: Codable {
        let icon: String
    }
}
