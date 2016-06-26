//: Playground - noun: a place where people can play

// Error Handling

Int.init("1")

Int.init("abc")

struct Friend {
	let name: String
	let age: String
	let address: String
}

enum FriendError : ErrorType {
	case InvalidData(String)
	case NetworkError
}

func createFriendFromJSON(dict: [String : String]) throws -> Friend {
	guard let name = dict["name"] else {
		throw FriendError.InvalidData("Name key fails")
	}
	guard let age = dict["age"] else {
		throw FriendError.InvalidData("Age key fails")
	}
	guard let address = dict["address"]  else {
		throw FriendError.InvalidData("Address key fails")
	}
	
	return Friend(name: name, age: age, address: address)
}

func sendMessageToFriend(friend: Friend, message: String) {}

let response = ["name": "John Reese", "ages": "38", "address": "someAddress"]

do {
	let friend = try createFriendFromJSON(response)
	sendMessageToFriend(friend, message: "")
} catch FriendError.InvalidData(let key) {
	print(key)
} catch FriendError.NetworkError {
	
}

/*
*func processFile(filename: String) throws {
*	if exists(filename) {
*		let file = open(filename)
*		defer {
*			close(file)
*		}
*
*		while let line = try file.readLine() {
*			// Work with the file
*		}
*		// close file is called here at the end of the scope
*	}
*}
*/

/*
* var error: NSError? = nil
*
* let data = NSData(contentsOfUrl: someURL, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: error)
*
*
* if data == nil {
*	// Check error object
* }
*/