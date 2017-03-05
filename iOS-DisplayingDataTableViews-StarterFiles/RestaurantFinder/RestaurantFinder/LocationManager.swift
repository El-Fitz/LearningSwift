//
//  LocationManager.swift
//  RestaurantFinder
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
	let manager = CLLocationManager()
	
	override init() {
		super.init()
		manager.delegate = self
	}
	
	func getPermission() {
		if CLLocationManager.authorizationStatus() == .NotDetermined {
			manager.requestWhenInUseAuthorization()
		} else if CLLocationManager.authorizationStatus() == .Denied {
			
		}
	}
}
