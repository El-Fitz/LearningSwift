//
//  LocationManager.swift
//  RestaurantFinder
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import CoreLocation

extension Coordinate {
	init(location: CLLocation) {
		latitude = location.coordinate.latitude
		longitude = location.coordinate.longitude
	}
}

final class LocationManager: NSObject, CLLocationManagerDelegate {
	let manager = CLLocationManager()
	
	var onLocationFix: (Coordinate -> Void)?
	
	override init() {
		super.init()
		manager.delegate = self
		manager.desiredAccuracy = kCLLocationAccuracyKilometer
	}
	
	func getPermission() {
		if CLLocationManager.authorizationStatus() == .NotDetermined {
			manager.requestWhenInUseAuthorization()
		} else if CLLocationManager.authorizationStatus() == .Denied {
			
		}
	}
	
	// MARK: CLLocationManagerDelegate
	
	func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		if status == .AuthorizedWhenInUse {
			manager.requestLocation()
		}
	}
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		debugPrint("Failed getting location: \(error)")
	}
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		
		let coordinate = Coordinate(location: location)
		if let onLocationFix = onLocationFix {
			onLocationFix(coordinate)
		}
		
	}
}
