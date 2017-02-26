//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func doubler(i: Int) -> Int {
	return i * 2
}

let doubleFunction = doubler
doubleFunction(2)

let numbers = [1,2,11,4,5]
let doubleNumbers = numbers.map(doubleFunction)

/****************************/

let tripledNumbers = numbers.map({ (i: Int) -> Int in
	return i * 3
})

// Rule #2: Inferring type from context
let quadrupleNumbers = numbers.map({ i in
	return i * 4
})

// Rule #3: Implicit returns from single-expression Closures
numbers.map({i in
	i * 0
})

// Rule #4: Shorthand argument names
numbers.map({
	$0 * 10
})

// Rule #5: Trailing Closures
numbers.map() {
	$0 * 10
}

/****************************/

[1,2,11,4,5].map() { (digit: Int) -> Int in
	if digit % 2 == 0 { return digit / 2 }
	else { return digit }
}


/****************************/

// Rule #6: Ignoring Parentheses

numbers.map { $0 * 3 }

func doubleValue(i: Int) -> Int {
	return i * 2
}

let doubler2 = doubleValue
let doubledValues = [1,2,3,4].map { doubleValue(i: $0) }