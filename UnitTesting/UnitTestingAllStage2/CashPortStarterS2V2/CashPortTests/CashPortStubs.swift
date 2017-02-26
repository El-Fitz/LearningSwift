//
//  CashPortStubs.swift
//  CashPort
//
//  Created by Gabe Nadel on 8/31/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import XCTest
@testable import CashPort

class CashPortStubs: XCTestCase {
    
    var mockNetworkingController = MockNetworkingController()
    var viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        viewController.networkingController = mockNetworkingController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController.networkingController = NetworkingController()
        super.tearDown()
    }
    
    func testFormatMovers(){
        
        let moverString = viewController.formatMovers()
        
        XCTAssert(moverString == "ABC: 2.0 - 1.0  XYZ: 3.0 - 2.0  ", "MoverString is NOT formatting correctly")
    }
    
    class MockNetworkingController: NetworkingController{
        
        override func downloadMovers() -> [[String : String]] {
            return [["Code" : "ABC", "High" : "2.0", "Low" : "1.0"], ["Code" : "XYZ", "High" : "3.0", "Low" : "2.0"]]
        }
        
    }
    
}
