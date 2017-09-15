//
//  UMAI_TODOTests.swift
//  UMAI_TODOTests
//
//  Created by Cognizant on 14/09/17.
//  Copyright © 2017 UMAI. All rights reserved.
//

import XCTest
@testable import UMAI_TODO

class UMAI_TODOTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testSaveItem() {
    let pendingVC = PendingTableViewController()
    let itemName = "Save Test"
    let status = false
    pendingVC.saveItem(itemDescription: itemName, status: status)
    let itemsList = Common.sharedInstance.items
    let savedItem: TodoItem = TodoItem()
    savedItem.itemDescription = itemName
    savedItem.status = status
    XCTAssertEqual(itemsList[0].itemDescription, savedItem.itemDescription)
    XCTAssertEqual(itemsList[0].status, savedItem.status)
  }
  
}
