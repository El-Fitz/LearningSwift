//
//  CashPortMocks.swift
//  CashPort
//
//  Created by Gabe Nadel on 8/31/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import XCTest
@testable import CashPort

class CashPortMocks: XCTestCase {
	
	let networkingController = NetworkingController()
	let mockNotificationCenter = MockNotificationCenter()
	
	override func setUp() {
		super.setUp()
		networkingController.notificationCenter = mockNotificationCenter
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		networkingController.notificationCenter = NotificationCenter.default
		super.tearDown()
	}
	
	func testPostAlertNotifcation(){
		networkingController.postAlertNotification()
		XCTAssertTrue(mockNotificationCenter.didReceiveUserDataNotification,"USerDatAlert notification NOT sent")
	}
	
	
	
	class MockNotificationCenter: NotificationCenter {
		
		var didReceiveUserDataNotification = false
		
		override func post(name aName: NSNotification.Name, object anObject: Any?) {
			
			if aName == NSNotification.Name(rawValue:"UserDataAlert") {
				
				didReceiveUserDataNotification = true
			}
		}
	}
	
}
