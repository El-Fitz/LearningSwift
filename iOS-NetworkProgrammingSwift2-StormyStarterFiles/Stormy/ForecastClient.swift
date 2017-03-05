//
//  ForecastClient.swift
//  Stormy
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
	let latitude: Double
	let longitude: Double
}

enum Forecast: Endpoint {
	case Current(token: String, coordinate: Coordinate)
	
	var baseURL: NSURL {
		return NSURL(string: "https://api.forecast.io")!
	}
	
	var path: String {
		switch self {
		case .Current(token: let token, let coordinate) :
			return "/forecast/\(token)/\(coordinate.latitude),\(coordinate.longitude)"
		}
	}
	
	var request: NSURLRequest {
		let url = NSURL(string: path, relativeToURL: baseURL)!
		return NSURLRequest(URL: url)
	}
}

final class ForecastAPIClient: APIClient {
	let configuration: NSURLSessionConfiguration
	lazy var session: NSURLSession = {
		return NSURLSession(configuration: self.configuration)
	}()
	
	private let token: String
	
	init(config: NSURLSessionConfiguration, APIKey: String) {
		self.configuration = config
		self.token = APIKey
	}
	
	convenience init (APIKey: String) {
		self.init(config: NSURLSessionConfiguration.defaultSessionConfiguration(), APIKey: APIKey)
	}
	
	func fetchCurrentWeather(coordinate: Coordinate, completion: APIResult<CurrentWeather> -> Void) {
		let request = Forecast.Current(token: self.token, coordinate: coordinate).request
		
		fetch(request, parse: { json -> CurrentWeather? in
			// Parse from JSON to CurrentWeather
			
			if let currentWeatherDictionnary = json["currently"] as? [String : AnyObject] {
				return CurrentWeather(JSON: currentWeatherDictionnary)
			} else {
				return nil
			}
			}, completion: completion)
	}
}
