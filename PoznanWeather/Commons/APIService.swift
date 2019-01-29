//
//  APIService.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 29/01/2019.
//  Copyright © 2019 Adrian Kwiatkowski. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIService {
    
    static let apiURL = "https://api.openweathermap.org/data/2.5/forecast/daily?id=7530858&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
    
    static func fetchWeatherData(completion: @escaping (JSON)->()) {
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)["list"]
                completion(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
