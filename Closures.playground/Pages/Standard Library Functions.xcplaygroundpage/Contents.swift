//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let val = [1,2,3,4,5]

var newArr: [Int] = []
for number in val {
	newArr.append(number * 2)
}

let tripledVal = val.map { $0 * 3 }

// Map

extension Array {
	func map<T>(transform: (Element) -> T) -> [T] {
		var result: [T] = []
		
		for x in self {
			result.append(transform(x))
		}
		return result
	}
}

let intVals = ["1", "2", "3", "a", "4"].map { Int($0) }


struct Formatter {
	static let formatter = DateFormatter()
	
	static func dateFromString(dateString: String) -> NSDate? {
		formatter.dateFormat = "d MMM yyyy"
		return formatter.date(from: dateString) as NSDate?
	}
}

let dateStrings = ["10 Oct 1988", "11 Jan 1947", "28 Mar 2002"]

let dates = dateStrings.map { Formatter.dateFromString(dateString: $0) }
dates

// Flat Map

struct Post {
	var content: String
	var tags: [String]
}

let blog = [
	Post(content: "Hello, world!", tags: ["first", "programming"]),
	Post(content: "Just another short post", tags: ["general"])
]

blog.map { $0.content }

let tags = blog.map { $0.tags }
tags

let flatTags = blog.flatMap { $0.tags }
flatTags

extension Array {
	func flatMap<T>(transform: (Element) -> [T]) -> [T] {
		var res: [T] = []
		for x in self {
			res.append(contentsOf: (transform(x)))
		}
		return res
	}
}


// Filter

import UIKit

struct Account {
	let username: String
	let billingAddress: String?
}


let allUsers = [
	Account(username: "pasanpr", billingAddress: nil),
	Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
	Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
	Account(username: "sketchings", billingAddress: nil),
	Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]

let validAdresses = allUsers.flatMap { $0.billingAddress }
validAdresses

let evenNumbers = (0...100).filter { $0 % 2 == 0 }
evenNumbers

extension Array {
	func filter(includeElement: (Element) -> Bool) -> [Element] {
		var res: [Element] = []
		
		for x in self where includeElement(x) {
			res.append(x)
		}
		return res
	}
}

let pUsers = allUsers.filter { $0.username.characters.first == "p" }


// Reduce

let scores = [10, 12, 11, 10, 12, 9]
let totalScore = scores.reduce(0, { total, score in total + score })

print(totalScore)

extension Array {
	func reduce <T> (initial: T, combine: (T, Element) -> T) -> T {
		var res = initial
		for x in self {
			res = combine(res, x)
		}
		return res
	}
}

let dataSet = (1...100).filter { $0 % 3 == 0 && $0 % 7 == 0 }
print(dataSet)
let identifier = dataSet.reduce("", {str, num in str + "\(num)"})
print(identifier)




