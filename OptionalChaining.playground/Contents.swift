//: Playground - noun: a place where people can play

class Address {
	var streetName: String?
	var buildingNumber: String?
	var apartmentNumber: String?
}

class Residence {
	var address: Address?
}

class Person {
	var residence: Residence?
}

let susan = Person()

var address = Address()
address.streetName = "96 bd Bessières"
address.buildingNumber = "NA"
address.apartmentNumber = "1114"

let residence = Residence()
residence.address = address

susan.residence = residence

if let home = susan.residence,
	let postalAddress = home.address,
	let apartmentNumber = postalAddress.apartmentNumber,
	let convertedNumber = Int(apartmentNumber) {
		print(convertedNumber)
}

susan.residence?.address?.apartmentNumber = "12"

if let apartmentNumber = susan.residence?.address?.apartmentNumber {
	print(apartmentNumber)
}