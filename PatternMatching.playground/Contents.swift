//: Playground - noun: a place where people can play

enum Coin: Double {
	case Penny = 0.01
	case Nickel = 0.05
	case Dime = 0.10
	case Quarter = 0.25
}

let wallet: [Coin] =
	[.Penny, .Nickel, .Dime, .Dime, .Quarter, .Quarter, .Quarter, .Penny, .Nickel, .Dime, .Penny, .Nickel, .Quarter, .Quarter, .Penny]

var count: Int = 0

for coin in wallet {
	switch coin {
	case .Quarter: count += 1
	default: continue
	}
}

for case .Quarter in wallet {
	count += 1
}

for coin in wallet {
	if case .Nickel = coin {
		print("screw that, I'm poor")
	} else if case .Dime = coin {
		print("Hey, money !")
	}
}

let someOptionnal: Int? = 42

if case .Some(let x) = someOptionnal {
	print(x)
}

// Nil Coalescing Operator

let firstName: String? = "Pasan"
let username = "Pasanpr"

var displayName: String

if firstName != nil {
	displayName = firstName!
} else {
	displayName = username
}

displayName = firstName != nil ? firstName! : username

displayName = firstName ?? username