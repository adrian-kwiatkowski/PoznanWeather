//
//  WeatherManagerTests.swift
//  PoznanWeatherTests
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import XCTest
@testable import PoznanWeather

class WeatherManagerTests: XCTestCase {
    
    var sut = WeatherManager()
    let exampleWeatherData = WeatherDataModelSpy()
    
    func testDaysArrayCountReturnsZero() {
        XCTAssertTrue(sut.daysArrayCount == 0)
    }
    
    func testAdd_DaysCountReturnsOne() {
        let initialDaysCount = sut.daysArrayCount
        sut.addDay(data: exampleWeatherData)
        XCTAssertEqual(sut.daysArrayCount, initialDaysCount + 1)
    }

    func testQuery_ReturnsDayAtIndex() {
        sut.addDay(data: exampleWeatherData)
        XCTAssertEqual(sut.dayAtIndex(index: 0), exampleWeatherData)
    }
    
}

//MARK: - Helpers
class WeatherDataModelSpy: WeatherDataModel {
    init() {
        super.init(date: "0", avgTemperature: 0.0, pressure: 0.0, weatherIcon: "0", maxTemperature: 0.0, minTemperature: 0.0, humidity: 0, windSpeed: 0.0, windDirection: 0)
    }
}
