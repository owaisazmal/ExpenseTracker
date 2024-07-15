//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/24/24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2024", institution: "abcd", account: "Visa abcd", merchant: "Samsung", amount: 15.32, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
