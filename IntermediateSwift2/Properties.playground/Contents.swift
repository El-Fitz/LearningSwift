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