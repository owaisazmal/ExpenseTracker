//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Khan, Owais on 7/10/24.
//

import Foundation
import Combine

typealias transactionGroup = [String: [Transaction]]

final class TransactionListViewMode: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getTransaction()
    }
    
    func getTransaction(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else{
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{ (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case.failure(let error):
                    print("Error fetching transaction: ", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                //dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
//    func groupTransactionByMonth() -> transactionGroup {
//        guard !transactions.isEmpty else { return[:] }
//        
//       let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
//        
//        return groupedTransactions
//    }
}
