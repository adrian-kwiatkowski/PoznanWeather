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
    
    var sut: WeatherManager!
    let exampleWeatherData = WeatherDataModel(date: 1528106400, temperature: 295.15, pressure: 1012.5, weatherIcon: "04d")
    
    override func setUp() {
        super.setUp()
        sut = WeatherManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDaysArrayCountReturnsZero() {
        XCTAssertEqual(sut.daysArrayCount, 0)
    }
    
    func testAdd_DaysCountReturnsOne() {
        sut.addDay(data: exampleWeatherData)
        XCTAssertEqual(sut.daysArrayCount, 1)
    }

    func testQuery_ReturnsDayAtIndex() {
        sut.addDay(data: exampleWeatherData)
        XCTAssertEqual(sut.dayAtIndex(index: 0), exampleWeatherData)
    }
    
}
