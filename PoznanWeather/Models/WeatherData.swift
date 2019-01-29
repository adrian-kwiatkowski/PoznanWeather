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
    let list: [TEMPWeatherData]
}

struct TEMPWeatherData: Codable {
    let dt: Int
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
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}

struct WeatherData: Equatable, Codable {
    let date: String
    let avgTemperature: Float
    let pressure: Float
    let weatherIcon: String
    let maxTemperature: Float
    let minTemperature: Float
    let humidity: Int
    let windSpeed: Float
    let windDirection: Int
    
    init (date: String, avgTemperature: Float, pressure: Float, weatherIcon: String, maxTemperature: Float, minTemperature: Float, humidity: Int, windSpeed: Float, windDirection: Int){
        self.date = date
        self.avgTemperature = avgTemperature
        self.pressure = pressure
        self.weatherIcon = weatherIcon
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDirection = windDirection
    }
    
    static func == (lhs: WeatherData, rhs: WeatherData) -> Bool {
        guard lhs.date == rhs.date else {return false}
        guard lhs.avgTemperature == rhs.avgTemperature else {return false}
        guard lhs.pressure == rhs.pressure else {return false}
        guard lhs.weatherIcon == rhs.weatherIcon else {return false}
        guard lhs.maxTemperature == rhs.maxTemperature else {return false}
        guard lhs.minTemperature == rhs.minTemperature else {return false}
        guard lhs.humidity == rhs.humidity else {return false}
        guard lhs.windSpeed == rhs.windSpeed else {return false}
        guard lhs.windDirection == rhs.windDirection else {return false}
        
        return true
    }
}
