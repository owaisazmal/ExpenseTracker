//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 6/20/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewMode
    
    var body: some View {
        VStack {
            NavigationView{
                ScrollView{
                    VStack(alignment: .leading, spacing: 24) {
                        //Mark: Tiltle
                        Text("Overview")
                            .font(.title2)
                            .bold()
                        
                        //Chart
                        let data = transactionListVM.accumulateTransactions()
                        
                       // if !data.isEmpty{
                            let totalExpense = data.last?.1 ?? 0
                            
                            CardView {
                                VStack{
                                    ChartLabel(totalExpense.formatted(.currency(code: "USD")), type: .title)
                                    
                                    LineChart()
                                }
                                .background(Color.systemBackground)
                            }
                            
                            .data(data)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                            .frame(height: 300)
                            
                        //}
                        
                        // Transaction List
                        RecentTransactionList()
                    }
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .background(Color.Background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    // Notification Icon
                    ToolbarItem{
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
            .navigationViewStyle(.stack)
            .accentColor(.primary)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewMode = {
        let transactionListVM = TransactionListViewMode()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
