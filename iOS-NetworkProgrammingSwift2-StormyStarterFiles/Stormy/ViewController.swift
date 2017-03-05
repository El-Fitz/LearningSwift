//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 4/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

extension CurrentWeather {
	var temperatureString: String {
		return "\(Int(temperature))°"
	}
	var humidityString: String {
		let percentageValue = Int(humidity * 100)
		return "\(percentageValue)%"
	}
	var precipitationProbabilityString: String {
		let percentageValue = Int(precipitationProbability * 100)
		return "\(percentageValue)%"
	}
}

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let icon = WeatherIcon.PartlyCloudyDay.image
		let currentWeather = CurrentWeather(temperature: 56.0, humidity: 1.0, precipitationProbability: 1.0, summary: "Wet and rainy !", icon: icon)
		display(currentWeather)
		
		let forecastAPIKey = "9cbab6144d55482bb0b8f322d1947eb6"
		let baseURL = NSURL(string: "https://api.darksky.net/forecast/\(forecastAPIKey)/")
		let forecastURL = NSURL(string: "37.8267,-122.4233", relativeToURL: baseURL)

		let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
		let session = NSURLSession(configuration: configuration)
		
		let request = NSURLRequest(URL: forecastURL!)
		
		let dataTask = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
			debugPrint(data)
		})
		dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func display(weather: CurrentWeather) {
		currentTemperatureLabel.text = weather.temperatureString
		currentPrecipitationLabel.text = weather.precipitationProbabilityString
		currentHumidityLabel.text = weather.humidityString
		currentSummaryLabel.text = weather.summary
		currentWeatherIcon.image = weather.icon
	}
}

