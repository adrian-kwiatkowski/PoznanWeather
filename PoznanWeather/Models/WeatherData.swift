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
    
    let date: Int
    let dateString: String?
    let temp: Temperature
    let pressure: Float
    let humidity: Int
    let weather: [Weather]
    let windSpeed: Float
    let windDirection: Int
    
    enum CodingKeys: String, CodingKey {
        
        case date = "dt"
        case dateString
        case temp
        case pressure
        case humidity
        case weather
        case windSpeed = "speed"
        case windDirection = "deg"
    }
    
    struct Temperature: Codable {
        
        let avg: Float
        let min: Float
        let max: Float
        
        enum CodingKeys: String, CodingKey {
            
            case avg = "day"
            case min
            case max
        }
    }
    
    struct Weather: Codable {
        
        let icon: String
    }
}
