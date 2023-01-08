//
//  Expense.swift
//  iExpenses
//
//  Created by Амир Кайдаров on 1/8/23.
//

import Foundation

struct Expense : Identifiable, Codable {
    var id = UUID()
    let name : String
    let type : ExpenseType
    let price : Double
}
