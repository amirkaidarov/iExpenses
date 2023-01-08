//
//  ExpensesViewModel.swift
//  iExpenses
//
//  Created by Амир Кайдаров on 1/8/23.
//

import Foundation

class ExpensesViewModel : ObservableObject {
    @Published var items = [Expense]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([Expense].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = [Expense]()
    }
    
}
