//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func printString (aString: String) {
	print("Priting the string passed in: \n\"\(aString)\"")
}

printString(aString: "Hi, my Name is No One")

let someFunction = printString

someFunction("Hello !")

/***********************/

func sum(a: Int, b: Int) -> Int {
	return a + b
}

let addTwoNumbers = sum
addTwoNumbers(1, 9)

/***********************/

func displayString(a: (String) -> ()) {
	a("I'm a function in another function !")
}

displayString(a: someFunction)

/***********************/

extension Int {
	func apply(operation: (Int) -> Int) -> Int {
		return operation(self)
	}
}

func double(val: Int) -> Int {
	return val * 2
}

10.apply(operation: double)

func closestMultipleOfSix(val: Int) -> Int {
	for x in 1...100 {
		let multiple = x * 6
		if multiple - val < 6 && multiple > val {
			return multiple
		} else if multiple == val {
			return val
		}
	}
	return 0
}

32.apply(operation: closestMultipleOfSix)
64.apply(operation: closestMultipleOfSix)

/***********************/

typealias IntegerFunction = (Int) -> ()

func gameCounter() -> IntegerFunction {
	var counter = 0
	func increment(i: Int) {
		counter += i
		print("Counter value: \(counter)")
	}
	return increment
}

let aCounter = gameCounter()
aCounter(1)
aCounter(1)
aCounter(90)

let anotherCounter = gameCounter()

anotherCounter(10)
anotherCounter(12)

aCounter(3)

