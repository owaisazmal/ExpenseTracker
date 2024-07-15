//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 7/12/24.
//

import SwiftUI


struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewMode
    
    var body: some View {
        VStack{
            List{
                // Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){month,
                    transactions in
                    Section {
                        // Transaction Lists
                        ForEach(transactions) {transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        //Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewMode = {
        let transactionListVM = TransactionListViewMode()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View{
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            }
        }
        .environmentObject(transactionListVM)
    }
}
