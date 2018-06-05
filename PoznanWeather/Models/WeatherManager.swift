//
//  WeatherManager.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import Foundation
import Alamofire

class WeatherManager {
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/forecast/daily"
    //https://api.openweathermap.org/data/2.5/forecast/daily?id=7530858&cnt=7&appid=ad4e521f54b155390c178acc59582f10
    let APP_ID = "ad4e521f54b155390c178acc59582f10"
    
    var daysArrayCount: Int { return daysArray.count }
    var daysArray = [WeatherDataModel]()
    
    func addDay(data: WeatherDataModel) {
        daysArray.append(data)
    }
    
    func dayAtIndex(index: Int) -> WeatherDataModel {
        return daysArray[index]
    }
    
    func getWeatherData() {
        let parameters = ["id" : "7530858", "cnt" : "7", "appid" : APP_ID]
        Alamofire.request(WEATHER_URL, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                //let weatherJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData()
                print(response.result.value!)
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    func updateWeatherData() {
        
    }
}
