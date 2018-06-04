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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ModelCreatedWithAllProperties() {
        let modelUnderTest = WeatherDataModel(date: 1528106400, temperature: 295.15, pressure: 1012.5, weatherIcon: "04d")
        
        XCTAssertNotNil(modelUnderTest)
        XCTAssertEqual(modelUnderTest.date, 1528106400)
        XCTAssertEqual(modelUnderTest.temperature, 295.15)
        XCTAssertEqual(modelUnderTest.pressure, 1012.5)
        XCTAssertEqual(modelUnderTest.weatherIcon, "04d")
    }
    
}
