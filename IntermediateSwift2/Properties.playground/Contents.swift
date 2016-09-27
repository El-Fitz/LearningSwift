//: Playground - noun: a place where people can play

import UIKit


// Type Properties
struct Point {
	let x: Int
	let y: Int
}

struct Map {
	static let origin = Point(x: 0, y: 0)
}

Map.origin



// Computed Properties

struct Rectangle {
	var length: Int
	var width: Int
	
	var area: Int {
		return length * width
	}
}

let r1 = Rectangle(length: 8, width: 122)

r1.area

struct Point🙂 {
	var x: Int = 0
	var y: Int = 0
}

struct Size🙂 {
	var width: Int = 0
	var height: Int = 0
}

struct Rectangle🙂 {
	var origin = Point🙂()
	var size = Size🙂()
	
	var center: Point🙂 {
		get {
			let centerX = origin.x + size.width / 2
			let centerY = origin.y + size.height / 2
			return Point🙂(x: centerX, y: centerY)
		}
		set(centerValue) {
			origin.x = centerValue.x - size.width / 2
			origin.y = centerValue.y - size.height / 2
		}
	}
}

var rect = Rectangle🙂()
print (rect.center)

rect.center = Point🙂(x: 10, y: 15)
print(rect.center)


enum ReadingMode {
	case Day
	case Evening
	case Night
	
	var statusBarStyle: UIStatusBarStyle {
		switch self {
		case .Day, .Evening: return .default
		case .Night: return .lightContent
		}
	}
	
	var headlineColor: UIColor {
		switch self {
		case .Night: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		case .Evening, .Day: return UIColor(red: 16/255.0, green: 16/255.0, blue: 16/255.0, alpha: 1.0)
		}
	}
	
	var dateColor: UIColor {
		switch self {
		case .Day, .Evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
		case .Night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
		}
	}
	
	var bodyTextColor: UIColor {
		switch self {
		case .Day, .Evening: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		case .Night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
		}
	}
	
	var linkColor: UIColor {
		switch self {
		case .Day, .Evening: return UIColor(red: 68/255.0, green: 133/255.0, blue: 164/255.0, alpha: 1.0)
		case .Night: return UIColor(red: 129/255.0, green: 161/255.0, blue: 166/255.0, alpha: 1.0)
		}
	}
}

let titleLabel = UILabel()

func readingViewWithMode(readingMode: ReadingMode) {
	titleLabel.textColor = readingMode.headlineColor
}

class ReadItLaterClient {
	lazy var session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
	
	/*
	Do the rest of the work
	*/
}