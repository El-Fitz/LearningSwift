//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

enum err: Error {
	case DivideByZero
}

extension Int {
	func apply(value: Int, operation: (Int, Int) throws -> Int) rethrows -> Int {
		return try operation(self, value)
	}
}

try 10.apply(value: 12) {
	if $1 == 0 {
		throw err.DivideByZero
	}
	return $0 / $1
}

try 10.apply(value: 0) {
	if $1 == 0 {
		throw err.DivideByZero
	}
	return $0 / $1
}

10.apply(value: 12) { $0 + $1 }

