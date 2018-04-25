//
//  RefactoringSampleTests.swift
//  RefactoringSampleTests
//
//  Created by Jannie Theron on 2018/04/25.
//  Copyright © 2018 Jannie Theron. All rights reserved.
//

import XCTest
@testable import RefactoringSample

class RefactoringSampleTests: XCTestCase {

    var sut = Customer(name: "test")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStatement_NoMoviesRented() {

        XCTAssertEqual(sut.statement(), "Rental for test\nAmount owed is 0.0\nYou earned 0 frequent renter points")
    }

    func testStatement_RentingOneRegularMovie() {
        let movie = Movie(title: "Days of Thunder", priceCode: Movie.regular)

        sut.add(rental: Rental(movie: movie, daysRented: 3))

        XCTAssertEqual(sut.statement(), "Rental for test\nAmount owed is 3.5\nYou earned 1 frequent renter points")
    }

    func testStatement_RentingOneNewReleaseMovie() {
        let movie = Movie(title: "Avengers 15", priceCode: Movie.newRelease)

        sut.add(rental: Rental(movie: movie, daysRented: 2))

        XCTAssertEqual(sut.statement(), "Rental for test\nAmount owed is 6.0\nYou earned 2 frequent renter points")
    }

    func testStatement_RentingOneChildrensMovie() {
        let movie = Movie(title: "My Little Pony", priceCode: Movie.children)

        sut.add(rental: Rental(movie: movie, daysRented: 5))

        XCTAssertEqual(sut.statement(), "Rental for test\nAmount owed is 4.5\nYou earned 1 frequent renter points")
    }
}
