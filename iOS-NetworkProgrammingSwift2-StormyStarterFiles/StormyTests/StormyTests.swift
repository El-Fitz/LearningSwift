//
//  StormyTests.swift
//  StormyTests
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import XCTest
@testable import Stormy

class StormyTests: XCTestCase {
	
	var icon: UIImage!
	var currentWeather: CurrentWeather!
	
    override func setUp() {
        super.setUp()
		icon = WeatherIcon.PartlyCloudyDay.image
		currentWeather = CurrentWeather(temperature: 56.0, humidity: 1.0, precipitationProbability: 1.0, summary: "Wet and rainy !", icon: icon)
		
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		icon = nil
		currentWeather = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
