//
//  APIService.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 29/01/2019.
//  Copyright © 2019 Adrian Kwiatkowski. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    
    static let apiURL = "https://api.openweathermap.org/data/2.5/forecast/daily?id=7530858&cnt=7&appid=ad4e521f54b155390c178acc59582f10"
    
    static func fetchWeatherData(completion: @escaping (APIResponse)->()) {
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else { return }
                guard let decodedData = try? JSONDecoder().decode(APIResponse.self, from: data) else { return }
                completion(decodedData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
