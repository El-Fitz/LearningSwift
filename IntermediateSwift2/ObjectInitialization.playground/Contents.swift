//: Playground - noun: a place where people can play

import UIKit


// Failable and throwing Initializers

class Person {
	let name: String
	let age: Int
	
	init?(dict: [String : AnyObject]) {
		guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
			return nil
		}
		self.name = name
		self.age = age
	}
}

enum PersonError: Error {
	case InvalidData
}

class Person🙂 {
	let name: String
	let age: Int
	
	init (dict: [String : AnyObject]) throws {
		guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
			throw PersonError.InvalidData
		}
		self.name = name
		self.age = age
	}
}


// Initializer Delegation

struct Point {
	var x: Int = 0
	var y: Int = 0
}

struct Size {
	var width: Int = 0
	var height: Int = 0
}

struct Rectangle {
	var origin = Point()
	var size = Size()
	
	init(origin: Point, size: Size) {
		self.origin = origin
		self.size = size
	}
	
	init (x: Int, y: Int, height: Int, width: Int) {
		let origin = Point(x: x, y: y)
		let size = Size(width: width, height: height)
		self.init(origin: origin, size: size)
	}
	
	init (center: Point, size: Size) {
		let origin = Point(x: center.x - size.width / 2, y: center.y - size.height / 2)
		self.init(origin: origin, size: size)
	}
}

// Designated and Convenience Initializers

class Vehicle {
	var name: String
	
	init (name: String) {
		self.name = name
	}
	
	convenience init() {
		self.init(name: "Unnamed")
	}
}

