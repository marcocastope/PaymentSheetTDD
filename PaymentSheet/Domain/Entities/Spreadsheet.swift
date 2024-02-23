//
//  Spreadsheet.swift
//  PaymentSheet
//
//  Created by Marco Castope on 23/02/24.
//

import Foundation

struct Spreadsheet : Identifiable {
    var id = UUID()
    let paymentPeriod: String
    let paymentDate: String
    let employees: [Employee]
    
    func calculateTotalIncome() -> Double {
        var totalIncome = 0.0
        for e in employees {
            totalIncome += e.calculateTotalIncome()
        }
        return totalIncome
    }
    
    func calculateTotalDiscounts() -> Double {
        var totalDiscounts = 0.0
        for e in employees {
            totalDiscounts += e.calculateTotalDiscount()
        }
        return totalDiscounts
    }
    
    func calculateTotalPayments() -> Double {
        var totalPayments = 0.0
        for e in employees {
            totalPayments += e.calculatePayment()
        }
        return totalPayments
    }
}
