//
//  EmployeeTests.swift
//  PaymentSheetTests
//
//  Created by Marco Castope on 23/02/24.
//

import XCTest
@testable import PaymentSheet

final class EmployeeTests: XCTestCase {
    
    var sut: Employee!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Employee(
            name: "Jesús Abanto",
            dni: "10101212", 
            contractedHours: 20,
            hoursWorked: 30,
            contractedHourPayment: 10,
            discountRate: 0.10
        )
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_calculateIncomeContractedHours() {
        let expectedValue = 200.0
        let result = sut.calculateIncomeContractedHours()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateOvertimeIncome() {
        let expectedValue = 50.0
        let result = sut.calculateOvertimeIncome()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateTotalIncome() {
        let expectedValue = 250.0
        let result = sut.calculateTotalIncome()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateInsuranceDiscount() {
        let expectedValue = 20.0
        let result = sut.calculateInsuranceDiscount()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateDiscountHoursNotWorked_whenContractedHours_isLessThanHoursWorked() {
        sut = Employee(
            name: "Jesús Abanto",
            dni: "10101212",
            contractedHours: 20,
            hoursWorked: 30,
            contractedHourPayment: 10,
            discountRate: 0.10
        )
        let expectedValue = 0.0
        let result = sut.calculateDiscountHoursNotWorked()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateDiscountHoursNotWorked_whenContractedHours_isGreaterThanHoursWorked() {
        sut = Employee(
            name: "Jesús Abanto",
            dni: "10101212",
            contractedHours: 30,
            hoursWorked: 20,
            contractedHourPayment: 10,
            discountRate: 0.10
        )
        let expectedValue = 100.0
        let result = sut.calculateDiscountHoursNotWorked()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculateTotalDiscount() {
        let expectedValue = 20.0
        let result = sut.calculateTotalDiscount()
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_calculatePayment() {
        let expectedValue = 230.0
        let result = sut.calculatePayment()
        XCTAssertEqual(expectedValue, result)
    }
}
