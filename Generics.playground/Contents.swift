//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func switcheroo <T> ( a: inout T, b: inout T) {
	let tempA = a
	a = b
	b = tempA
}

var fivePt = 5.5
var tenPt = 10.5

switcheroo(a: &fivePt, b: &tenPt)

fivePt
tenPt

protocol Person {
	var name: String {get}
	var homeTown: String {get}
	var height: Double {get}
	
	associatedtype PositionType
	var positions: PositionType {get}
}

class Team {
	var name: String
	var city: String
	var winPCT: Double = 0.0
	
	init(name: String, city: String) {
		self.name = name
		self.city = city
	}
}

class CurlingTeam: Team {
	
}

class BobsledTeam: Team {
	
}

func teamBlurb <T: Team> (team: T) -> String {
	return "\(team.name) of \(team.city) has a winning percentage of \(team.winPCT)"
}

struct Player : Person {
	var name: String
	var height: Double
	var homeTown: String
	typealias PositionType = Array<String>
	var positions: PositionType
	
	init(name: String, height: Double, homeTown: String, positions: [String]) {
		self.name = name
		self.height = height
		self.homeTown = homeTown
		self.positions = positions
	}
}

struct Coach : Person {
	var name: String
	var height: Double
	var homeTown: String
	typealias PositionType = String
	var positions: String
	
	init(name: String, height: Double, homeTown: String, positions: String) {
		self.name = name
		self.height = height
		self.homeTown = homeTown
		self.positions = positions
	}
}

class StatGroup <T> {
	var members = [T]()
	var title: String
	
	init(title: String, members: [T]) {
		self.title = title
		self.members = members
	}
}

var blazers = Team(name: "Blazers", city: "Portland")
var nuggets = Team(name: "Nuggets", city: "Denver")

teamBlurb(team: blazers)

var hoopsUS = StatGroup(title: "NBA West", members: [blazers, nuggets])
hoopsUS.members

let testCoach = Coach(name: "Billy Martin", height: 68, homeTown: "Berkeley, CA", positions: "Head Coach")
var star = Player(name: "Pasan", height: 88, homeTown: "Chicago, IL", positions: ["15", "6", "11"])
var benchWarmer = Player(name: "Andrew", height: 66, homeTown: "Chicago, IL", positions: ["8", "0"])

var iceFencingUS = StatGroup(title: "Olympic Ice Fencing", members: [star, benchWarmer])

func getPersonalInfo <T: Person> (person: T) -> String {
	return "You have selected \(person.name) from \(person.homeTown)"
}

getPersonalInfo(person: testCoach)
getPersonalInfo(person: star)



struct Executive {
	var name: String
	var homeTown: String
	var height: Double
	
	var positions: String
}

extension Executive: Person {
	
}


func allItemsMatch<P1: Person, P2: Person where P1.PositionType == P2.PositionType> (p1: P1, p2: P2) -> Bool {
	return true
}

