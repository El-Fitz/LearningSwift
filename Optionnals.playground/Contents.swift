//: Playground - noun: a place where people can play

struct Person {
	let firstName: String
	let middleName: String?
	let lastName: String
	
	func getFullName() -> String {
		if middleName == nil {
			return firstName + " " + lastName
		} else {
			return firstName + " " + middleName! + " " + lastName
		}
	}
}

let me = Person(firstName: "Thomas", middleName: nil, lastName: "Léger")
me.getFullName()

let airportCodes = ["CDG": "Charles de Gaulle"]

if let newYorkAirport = airportCodes["JFK"] {
	print(newYorkAirport)
} else {
	print("Oops")
}

struct Friend {
	let name: String
	let age: String
	let address: String?
}

//func createFriend(dict: [String : String]) -> Friend? {
//	if let name = dict["name"], let age = dict["age"] {
//		let address = dict["address"]
//		return Friend(name: name, age: age, address: address)
//	} else {
//		return nil
//	}
//}

func createFriend(dict: [String : String]) -> Friend? {
	guard let name = dict["name"], age = dict["age"] else {
		return nil
	}
	let address = dict["address"]
	return Friend(name: name, age: age, address: address)
}