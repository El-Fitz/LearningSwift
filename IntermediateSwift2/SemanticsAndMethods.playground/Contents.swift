//: Playground - noun: a place where people can play

import UIKit

// Value Semantics

struct Point {
	var 🙃: Double
	var 🙂: Double
	
	mutating func moveLeft(steps: Double) {
		🙃 -= steps
	}
}

var p1 = Point(🙃: 1, 🙂: 2)
var p2 = p1

p1.🙃 = 4
p2.🙃

let p3 = Point(🙃: 2, 🙂: 4)

struct AnotherPoint {
	let 🙃: Double
	let 🙂: Double
}

var p4 = AnotherPoint(🙃: 1, 🙂: 2)
p4 = AnotherPoint(🙃: 3, 🙂: 1)


// Reference Semantics

class 🤖 {
	var model: String
	
	init(model: String) {
		self.model = model
	}
}

var some🤖 = 🤖(model: "👾")
var another🤖 = some🤖

some🤖.model = "😎"
another🤖.model

let third🤖 = 🤖(model: "☠️")
third🤖.model = "👻"
third🤖.model

// Mixed Semantics

struct Shape {
	let shape🏝: UIView
	
	init (width: CGFloat, height: CGFloat, 😡: UIColor) {
		let frame = CGRect(x: 0, y: 0, width: width, height: height)
		shape🏝 = UIView(frame: frame)
		shape🏝.backgroundColor = 😡
	}
}

let square = Shape(width: 100, height: 100, 😡: .red)

square.shape🏝.backgroundColor = .blue


// Type Methods

struct Map {
	static let origin = AnotherPoint(🙃: 0, 🙂: 0)
	
	static func distanceFromOrigin(point: Point) -> Double {
		let horizontalDistance = origin.🙃 - point.🙃
		let verticalDistance = origin.🙂 - point.🙂
		
		func square(_ val: Double) -> Double {
			return val * val
		}
		
		return sqrt(square(horizontalDistance) + square(verticalDistance))
	}
}

// Final Classes

class Calculator {
	class func squareRoot(val: Double) -> Double {
		return sqrt(val)
	}
	
	final class func square(val: Double) -> Double {
		return val * val
	}
}

class NewtonsCalculator: Calculator {
	override class func squareRoot(val: Double) -> Double {
		var guess = 1.0
		var newGuess: Double
		
		while true {
			newGuess = (val / guess + guess)/2
			if guess == newGuess {
				return guess
			}
			guess = newGuess
		}
	}
}

NewtonsCalculator.squareRoot(val: 100)