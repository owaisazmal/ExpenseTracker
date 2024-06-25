//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/24/24.
//

import Foundation

struct Transaction: Identifiable{
    let id: Int
    let date: String
    let institution:String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
