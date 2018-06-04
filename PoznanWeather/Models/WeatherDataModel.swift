//
//  WeatherDataModel.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation

class WeatherDataModel {
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
}
