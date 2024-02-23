//
//  SpreadsheetTests.swift
//  PaymentSheetTests
//
//  Created by Marco Castope on 23/02/24.
//

import XCTest

@testable import PaymentSheet

final class SpreadsheetTests: XCTestCase {
    
    var sut: Spreadsheet!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let employees = [
            Employee(
                name: "Marino Altuna",
                dni: "12345678",
                contractedHours: 20,
                hoursWorked: 20,
                contractedHourPayment: 10,
                discountRate: 0.10
            ),
            Employee(
                name: "Elena Arce",
                dni: "22233344",
                contractedHours: 30,
                hoursWorked: 20,
                contractedHourPayment: 10,
                discountRate: 0.10
            ),
            Employee(
                name: "Jesús Abanto",
                dni: "10101212",
                contractedHours: 20,
                hoursWorked: 30,
                contractedHourPayment: 10,
                discountRate: 0.10
            )
            
        ]
        sut = Spreadsheet(paymentPeriod: "201904", paymentDate: "2019-04-30", employees: employees)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_calculateTotalIncome() {
        let expectedResult = 750.0
        let result = sut.calculateTotalIncome()
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_calculateTotalDiscounts() {
        let expectedResult = 170.0
        let result = sut.calculateTotalDiscounts()
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_calculateTotalPayments() {
        let expectedResult = 580.0
        let result = sut.calculateTotalPayments()
        XCTAssertEqual(expectedResult, result)
    }
}
