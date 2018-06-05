//
//  WeatherDataModelTests.swift
//  PoznanWeatherTests
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import XCTest
@testable import PoznanWeather

class WeatherDataModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testInit_ModelCreatedWithAllProperties() {
        let modelUnderTest = WeatherDataModel(date: "05/06/2018", avgTemperature: 295.15, pressure: 1012.5, weatherIcon: "04d", maxTemperature: 293.23, minTemperature: 292.22, humidity: 55, windSpeed: 2.96, windDirection: 300)
        
        XCTAssertNotNil(modelUnderTest)
        XCTAssertEqual(modelUnderTest.date, "05/06/2018")
        XCTAssertEqual(modelUnderTest.avgTemperature , 295.15)
        XCTAssertEqual(modelUnderTest.pressure, 1012.5)
        XCTAssertEqual(modelUnderTest.weatherIcon, "04d")
        XCTAssertEqual(modelUnderTest.minTemperature, 292.22)
        XCTAssertEqual(modelUnderTest.maxTemperature , 293.23)
        XCTAssertEqual(modelUnderTest.humidity, 55)
        XCTAssertEqual(modelUnderTest.windSpeed, 2.96)
        XCTAssertEqual(modelUnderTest.windDirection, 300)
    }
    
}
