//
//  AddExpenseView.swift
//  iExpenses
//
//  Created by Амир Кайдаров on 1/8/23.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    var viewModel : ExpensesViewModel
    
    @State private var title = ""
    @State private var type = ExpenseType.personal
    @State private var amount = 0.0
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) { value in
                        Text(value.title)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button {
                    viewModel.items.append(Expense(name: title, type: type, price: amount))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
        }

        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(viewModel: ExpensesViewModel())
    }
}
