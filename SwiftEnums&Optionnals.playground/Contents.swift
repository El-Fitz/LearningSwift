//: Playground - noun: a place where people can play

import UIKit

let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]



func muteNotifications(day: String) -> Bool {
	if day == "Weekend" {
		return true
	} else {
		return false
	}
}

func weekdayOrWeekend(day: String) -> String {
	switch day {
	case "Saturday", "Sunday": return "Weekend"
	case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday": return "Weekday"
	default: return "This isn't a valid day in the Western calendar"
	}
}

let result = weekdayOrWeekend("Monday")
let isMuted = muteNotifications(result)

enum Day {
	case Monday
	case Tuesday
	case Wednesday
	case Thursday
	case Friday
	case Saturday
	case Sunday
}

enum DayType {
	case Weekday
	case Weekend
}

func weekdayOrWeekend(day: Day) -> DayType {
	switch day {
	case .Saturday, .Sunday: return .Weekend
	default: return .Weekday
	}
}

func muteNotifications(dayType: DayType) -> Bool {
	switch dayType {
	case .Weekend: return true
	case .Weekday: return false
	}
}

let result2 = weekdayOrWeekend(.Sunday)
let isMuted2 = muteNotifications(result2)

// Color Objects

import UIKit

enum ColorComponents {
	case RGB (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
	case HSB (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
	
	func color() -> UIColor {
		switch self {
		case .RGB(let redValue, let greenValue, let blueValue, let alphaValue):
			return UIColor(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0,
			               alpha: alphaValue)
		case .HSB(let hueValue, let saturationValue, let brightnessValue, let alphaValue):
			return UIColor(hue: hueValue/360, saturation: saturationValue/100.0,
			               brightness: brightnessValue/100.0, alpha: alphaValue)
		}
	}
}

ColorComponents.RGB(red: 61.0, green: 120.0, blue: 198.0, alpha: 1.0).color()


// Raw Values

enum HTTPMethode: String{
	case POST, GET, PUT, DELETE
}

HTTPMethode.POST.rawValue

enum HTTPStatusCodes: Int {
	case Continue = 100
	case Success = 200
	case Unauthorized = 401
	case Forbidden = 403
	case NotFound = 404
}

let statusCode = 200
if let httpCode = HTTPStatusCodes(rawValue: statusCode) {
	print(httpCode)
}


enum Compass: Int {
	case North = 0
	case South = 2
	case East = 1
	case West = 3
}

if let direction = Compass(rawValue: 2) {
	print(direction)
}