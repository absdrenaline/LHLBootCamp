////  SimplifiedPigLatinTests.swift
// Created: 2019-06-28
//


import XCTest
@testable import Pig_Latin

class SimplifiedPigLatinTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordGetsPigLatinized() {
        let stringFormatter = StringFormatter(string: "bootcamp")
        let result = stringFormatter.simplePigLatin()
        XCTAssertEqual(result, "ootcampbay")
    }
    
    func testWordWithDoubleConsonantsGetsPigLatinized() {
        let stringFormatter = StringFormatter(string: "smile")
        let result = stringFormatter.simplePigLatin()
        XCTAssertEqual(result, "ilesmay")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
