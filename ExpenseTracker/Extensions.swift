//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/21/24.
//

import Foundation
import SwiftUI

extension Color {
    static let Background = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Iniializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed()-> Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else{return Date()}
        
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double{
    func roundedToTwoDigits() -> Double{
        return (self * 100).rounded() / 100
    }
}
