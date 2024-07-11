//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/20/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewMode()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
