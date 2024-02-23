//
//  Employee.swift
//  PaymentSheet
//
//  Created by Marco Castope on 23/02/24.
//

import Foundation

struct Employee : Identifiable {
    var id = UUID()
    let name: String
    let dni: String
    let contractedHours: Int
    let hoursWorked: Int
    let contractedHourPayment: Int
    let discountRate: Double
    
    func calculateIncomeContractedHours() -> Double {
        return Double(contractedHours * contractedHourPayment)
    }
    
    func calculateOvertimeIncome() -> Double {
        var totalOvertime = 0
        if hoursWorked > contractedHours {
            totalOvertime = hoursWorked - contractedHours
        }
        let paymentHour = 0.50 * Double(contractedHourPayment)
        return Double(totalOvertime) * paymentHour
    }
    
    func calculateTotalIncome() -> Double {
        return calculateIncomeContractedHours() + calculateOvertimeIncome()
    }
    
    func calculateInsuranceDiscount() -> Double {
        return calculateIncomeContractedHours() * discountRate
    }
    
    func calculateDiscountHoursNotWorked() -> Double {
        var hoursNotWorked = 0
        if contractedHours > hoursWorked {
            hoursNotWorked = contractedHours - hoursWorked
        }
        return Double(hoursNotWorked * contractedHourPayment)
    }
    
    func calculateTotalDiscount() -> Double {
        return calculateInsuranceDiscount() + calculateDiscountHoursNotWorked() 
    }
    
    func calculatePayment() -> Double {
        return calculateTotalIncome() - calculateTotalDiscount()
    }
}
