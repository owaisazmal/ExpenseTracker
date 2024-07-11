//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 7/10/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewMode
    
    var body: some View {
        VStack{
            HStack{
                // Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //Header Link
                NavigationLink{
                    
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "cheveron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            //Recent  Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id:\.element) {index, transaction in
                    TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewMode = {
        let transactionListVM = TransactionListViewMode()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View{
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .environmentObject(transactionListVM)
    }
}
