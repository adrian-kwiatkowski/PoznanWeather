//
//  WeatherDataModel.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation

class WeatherDataModel: Equatable {
    let date: Int
    let temperature: Float
    let pressure: Float
    let weatherIcon: String
    
    init (date: Int, temperature: Float, pressure: Float, weatherIcon: String){
        self.date = date
        self.temperature = temperature
        self.pressure = pressure
        self.weatherIcon = weatherIcon
    }
    
    static func == (lhs: WeatherDataModel, rhs: WeatherDataModel) -> Bool {
        guard lhs.date == rhs.date else {return false}
        guard lhs.temperature == rhs.temperature else {return false}
        guard lhs.pressure == rhs.pressure else {return false}
        guard lhs.weatherIcon == rhs.weatherIcon else {return false}
        
        return true
    }
}
