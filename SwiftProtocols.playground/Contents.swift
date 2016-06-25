protocol FullyNameable {
	var fullName: String { get }
}

struct User: FullyNameable {
	var fullName: String
}

let user = User(fullName: "John Reese")

struct Friend: FullyNameable {
	let firstName: String
	let middleName: String
	let lastName: String
	
	var fullName: String {
		return "\(firstName) \(middleName) \(lastName)"
	}
}

let friend = Friend(firstName: "Harold", middleName: "Super", lastName: "Finch")

friend.fullName

protocol UserType {
	var name: String { get }
	var age: Int { get set }
}


/***************************************************************/


import Foundation

protocol Payable {
	func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int)
}

enum EmployeeType {
	case Manager
	case NotManager
}

class Employee {
	let name: String
	let address: String
	let startDate: NSDate
	let type: EmployeeType
	
	var department: String?
	var reportsTo: String?
	
	init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: EmployeeType) {
		self.name = fullName
		self.address = employeeAddress
		self.startDate = employeeStartDate
		self.type = employeeType
	}
	/*func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
		return (0, 0, 0, 0)
	}*/
}

func payEmployee(employee: Payable) {
	let paycheck = employee.pay()
}

class HourlyEmployee: Employee, Payable {
	var hourlyWage: Double = 15.00
	var hoursWorked: Double = 10
	let availableVacation = 0
	
	func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
		return (hourlyWage * hoursWorked, 0, 0, availableVacation)
	}
}

let hourlyEmployee = HourlyEmployee(fullName: "John Reese", employeeAddress: "non", employeeStartDate: NSDate(), employeeType: .NotManager)

payEmployee(hourlyEmployee)

let employee = Employee(fullName: "Root", employeeAddress: "Everywhere", employeeStartDate: NSDate(), employeeType: .Manager)
