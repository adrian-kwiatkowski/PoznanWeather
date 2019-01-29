//
//  APIService.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 29/01/2019.
//  Copyright © 2019 Adrian Kwiatkowski. All rights reserved.
//

import Foundation

struct APIService {
    
    static let apiURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?id=7530858&cnt=7&appid=ad4e521f54b155390c178acc59582f10")!
    
    static func fetchWeatherData(completion: @escaping (APIResponse)->()) {
        let task = URLSession.shared.dataTask(with: apiURL) { (data, _, error) in
            guard error == nil, let data = data else { return }
            guard let decodedData = try? JSONDecoder().decode(APIResponse.self, from: data) else { return }
            
            DispatchQueue.main.sync {
                completion(decodedData)
            }
        }
        task.resume()
    }
}
