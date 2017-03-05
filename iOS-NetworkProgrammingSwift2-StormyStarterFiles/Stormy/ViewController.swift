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
	
	
	let coordinate = Coordinate(latitude: 48.853661, longitude: 2.353106)
	var forecastAPIClient = ForecastAPIClient(APIKey: "9cbab6144d55482bb0b8f322d1947eb6")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchCurrentWeather()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func fetchCurrentWeather() {
		forecastAPIClient.fetchCurrentWeather(coordinate) { result in
			self.toggleRefreshAnimation(false)
			switch result {
			case .Success(let currentWeather):
				self.display(currentWeather)
				break
			case .Failure(let error as NSError):
				self.showAlert("Unable to retrieve forecast", message: error.localizedDescription)
				break
			default:
				break
			}
		}
	}
	
	func display(weather: CurrentWeather) {
		currentTemperatureLabel.text = weather.temperatureString
		currentPrecipitationLabel.text = weather.precipitationProbabilityString
		currentHumidityLabel.text = weather.humidityString
		currentSummaryLabel.text = weather.summary
		currentWeatherIcon.image = weather.icon
	}
	
	func showAlert(title: String, message: String?, style: UIAlertControllerStyle = .Alert) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
		let dismissAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
		alertController.addAction(dismissAction)
		presentViewController(alertController, animated: true, completion: nil)
	}
	
	@IBAction func refreshWeather(sender: AnyObject) {
		toggleRefreshAnimation(true)
		fetchCurrentWeather()
	}
	
	func toggleRefreshAnimation(on: Bool) {
		if on {
			//refreshButton.enabled = false
			activityIndicator.startAnimating()
		} else {
			//refreshButton.enabled = true
			activityIndicator.stopAnimating()
		}
	}
}

