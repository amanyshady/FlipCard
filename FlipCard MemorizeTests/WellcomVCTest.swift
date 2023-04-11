//
//  WellcomVCTest.swift
//  FlipCard MemorizeTests
//
//  Created by Amany Shady on 11/04/2023.
//

import XCTest

@testable import FlipCard_Memorize

final class WellcomVCTest: XCTestCase {
    
    var sut : WellcomeVC!
    
    override func setUp() {
        
        sut  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WellcomeVC")  as? WellcomeVC
        _ = sut.view

    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateButnRiundedCorner() {
        
        sut.viewDidLoad()
        let createButn = sut.createCardBtn!
        
        XCTAssertEqual(createButn.layer.cornerRadius, 20)
    }

    func testMemorizeButnRiundedCorner() {
        
        sut.viewDidLoad()
        let memorizeButn = sut.memorizeBtn!
        
        XCTAssertEqual(memorizeButn.layer.cornerRadius, 20)
    }

}
