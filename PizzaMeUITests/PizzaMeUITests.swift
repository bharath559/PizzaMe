//
//  PizzaMeUITests.swift
//  PizzaMeUITests
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import XCTest
import UIKit

class PizzaMeUITests: XCTestCase {
    
    var systemUnderTest:UITableViewController!
    
    override func setUp() {
        super.setUp()
        
        //continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        systemUnderTest = storyboard.instantiateViewControllerWithIdentifier("PizzaListTableViewController") as! UITableViewController
        
        //load view hierarchy
        _ = systemUnderTest.view
      
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testSUT_TableViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(systemUnderTest.tableView)
    }
    
    func testSUT_ShouldSetTableViewDataSource() {
        
        XCTAssertNotNil(systemUnderTest.tableView.dataSource)
    }
    
    func testSUT_ShouldSetTableViewDelegate() {
        
        XCTAssertNotNil(systemUnderTest.tableView.dataSource)
    }
    
    
    
    func testExample(){
        
//        XCUIDevice.sharedDevice().orientation = .FaceUp
//        XCUIDevice.sharedDevice().orientation = .FaceUp
//        
//        let app = XCUIApplication()
//        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["Patzeria Perfect Pizza"].tap()
//        XCTAssert (app.buttons["231 W 46th St New York NY"].exists)
        
    }
    
}
