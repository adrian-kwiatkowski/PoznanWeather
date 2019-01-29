//
//  WeatherManager.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation

class WeatherManager {
    
    var daysArrayCount: Int { return daysArray.count }
    var daysArray = [WeatherData]()
    
    func addDay(data: WeatherData) {
        daysArray.append(data)
    }
    
    func dayAtIndex(index: Int) -> WeatherData {
        return daysArray[index]
    }
    
    func getWeatherData(completion: @escaping ()->()) {
        APIService.fetchWeatherData { (response) in
            self.updateWeatherDataModel(response.list)
            completion()
        }
    }
    
    func updateWeatherDataModel(_ weatherData: [WeatherData]) {
        for item in weatherData {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let dateBeforeFormatting = Date(timeIntervalSince1970:TimeInterval(item.dt))
            let tmpDate = formatter.string(from: dateBeforeFormatting)
            
            let tmpAvgTemp = item.temp.day - 272.15
            let tmpPressure = item.pressure
            let tmpWeatherIcon = item.weather.first?.icon ?? ""
            let tmpMaxTemp = item.temp.max - 272.15
            let tmpMinTemp = item.temp.min - 272.15
            let tmpHumidity = item.humidity
            let tmpWindSpeed = item.speed
            let tmpWindDirection = item.deg
            
            let tempWeather = WeatherData(dt: item.dt, dateString: tmpDate, temp: WeatherData.Temperature(day: tmpAvgTemp, min: tmpMinTemp, max: tmpMaxTemp), pressure: tmpPressure, humidity: tmpHumidity, weather: [WeatherData.Weather(icon: tmpWeatherIcon), ], speed: tmpWindSpeed, deg: tmpWindDirection)
            
            addDay(data: tempWeather)
        }
    }
    
    func getWindDirectionString(index: Int) -> String {
        let windDirection = dayAtIndex(index: index).deg
        switch windDirection {
        case 0...45: return "N"
        case 46...90: return "NE"
        case 91...135: return "E"
        case 136...180: return "SE"
        case 181...225: return "S"
        case 226...270: return "SW"
        case 271...315: return "W"
        case 316...360: return "NW"
        default: return ""
        }
    }
}











