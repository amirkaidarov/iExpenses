//
//  ExpenseType.swift
//  iExpenses
//
//  Created by Амир Кайдаров on 1/8/23.
//

import Foundation

enum ExpenseType : Int, CaseIterable, Codable {
    case personal
    case business
    
    var title : String {
        switch self {
        case .personal: return "Personal"
        case .business: return "Business"
        }
    }
}
