//
//  UMAI_TODOUITests.swift
//  UMAI_TODOUITests
//
//  Created by Cognizant on 14/09/17.
//  Copyright © 2017 UMAI. All rights reserved.
//

import XCTest

class UMAI_TODOUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  /**
   - To Test Add action
   */
  
  func testAddItem() {
    let app = XCUIApplication()
    let addButton = app.navigationBars["TODO"].buttons["Add"]
    XCTAssertTrue(addButton.exists)
    
    // Tap add action
    addButton.tap()
    
    let addItemAlert = app.alerts["Add Item"]
    let addItemTitle = addItemAlert.staticTexts["Add Item"]
    let addAlertMessage = addItemAlert.staticTexts["Add an Item to your TODO List"]
    XCTAssertTrue(addItemAlert.exists)
    XCTAssertTrue(addItemTitle.exists)
    XCTAssertTrue(addAlertMessage.exists)
    
    // Type a description
    addItemAlert.collectionViews.textFields["Enter a TODO Item"].typeText("Sample")
    
    // Save action
    addItemAlert.buttons["Save"].tap()
    
    // To check if item is saved
    let savedITem = app.tables.cells.staticTexts["Sample"]
    XCTAssertTrue(savedITem.exists)
  }
    
}
