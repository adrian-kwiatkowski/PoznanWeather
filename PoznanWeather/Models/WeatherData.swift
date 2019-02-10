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
    
    private let date: Int
    private let dateString: String?
    private let temp: Temperature
    private let weather: [Weather]
    private let windDirection: Int
    private let pressure: Float

    let humidity: Int
    let windSpeed: Float
    
    var compDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateBeforeFormatting = Date(timeIntervalSince1970:TimeInterval(date))
        return formatter.string(from: dateBeforeFormatting)
    }
    
    var compPressure: Int {
        return Int(pressure)
    }
    
    var averageTemp: Int {
        return Int(temp.avg - 272.15)
    }
    
    var minimumTemp: Int {
        return Int(temp.min - 272.15)
    }
    
    var maximumTemp: Int {
        return Int(temp.max - 272.15)
    }
    
    var weatherIcon: String {
        return weather.first?.icon ?? ""
    }
    
    var windDirectionIcon: String {
        switch windDirection {
        case 0...45: return "⬆️"
        case 46...90: return "↗️"
        case 91...135: return "➡️"
        case 136...180: return "↘️"
        case 181...225: return "⬇️"
        case 226...270: return "↙️"
        case 271...315: return "⬅️"
        case 316...360: return "↖️"
        default: return ""
        }
    }
}


// MARK: - Helpers
extension WeatherData {

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
