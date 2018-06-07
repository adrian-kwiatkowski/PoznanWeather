//
//  WeatherManager.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast/daily?id=7530858&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
    
    var daysArrayCount: Int { return daysArray.count }
    var daysArray = [WeatherDataModel]()
    
    func addDay(data: WeatherDataModel) {
        daysArray.append(data)
    }
    
    func dayAtIndex(index: Int) -> WeatherDataModel {
        return daysArray[index]
    }
    
    func getWeatherData(completion: @escaping () -> ()) {
        Alamofire.request(weatherURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)["list"]
                self.updateWeatherDataModel(json)
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateWeatherDataModel(_ json: JSON) {
        for item in json.arrayValue {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let dateBeforeFormatting = Date(timeIntervalSince1970:TimeInterval(item["dt"].intValue))
            let tmpDate = formatter.string(from: dateBeforeFormatting)
            
            let tmpAvgTemp = item["temp"]["day"].floatValue - 272.15
            let tmpPressure = item["pressure"].floatValue
            let tmpWeatherIcon = item["weather"][0]["icon"].stringValue
            let tmpMaxTemp = item["temp"]["max"].floatValue - 272.15
            let tmpMinTemp = item["temp"]["min"].floatValue - 272.15
            let tmpHumidity = item["humidity"].intValue
            let tmpWindSpeed = item["speed"].floatValue
            let tmpWindDirection = item["deg"].intValue
            
            let tempWeather = WeatherDataModel(date: tmpDate, avgTemperature: tmpAvgTemp, pressure: tmpPressure, weatherIcon: tmpWeatherIcon, maxTemperature: tmpMaxTemp, minTemperature: tmpMinTemp, humidity: tmpHumidity, windSpeed: tmpWindSpeed, windDirection: tmpWindDirection)
            
            addDay(data: tempWeather)
        }
    }
    
    func getWindDirectionString(index: Int) -> String {
        let windDirection = dayAtIndex(index: index).windDirection
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











