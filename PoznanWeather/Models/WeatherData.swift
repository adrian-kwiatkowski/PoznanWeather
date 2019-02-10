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
    private let weather: [Weather]
    private let windDirection: Int
    private let pressure: Float

    let temp: Temperature
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
    
    var weatherIcon: UIImage? {
        let iconID = weather.first?.icon ?? "01d"
        let url = URL(string: "https://openweathermap.org/img/w/\(iconID).png")!
        let data = try? Data(contentsOf: url)
        return UIImage(data: data ?? Data())
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

    private enum CodingKeys: String, CodingKey {
        
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
        
        private let avg: Float
        private let min: Float
        private let max: Float
        
        var avgCelcius: Int {
            return Int(avg - 272.15)
        }
        
        var minCelcius: Int {
            return Int(min - 272.15)
        }
        
        var maxCelcius: Int {
            return Int(max - 272.15)
        }
        
        private enum CodingKeys: String, CodingKey {
            
            case avg = "day"
            case min
            case max
        }
    }
    
    struct Weather: Codable {
        
        let icon: String
    }
}
