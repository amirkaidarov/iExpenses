//
//  ExpensesView.swift
//  iExpenses
//
//  Created by Амир Кайдаров on 1/8/23.
//

import SwiftUI

struct ExpensesView: View {
    
    @ObservedObject var viewModel = ExpensesViewModel()
    
    @State var showAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.items, id: \.id) { item in
                        HStack {
                            VStack (alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.title)
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(item.price, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: removeItem)
                }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                    showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddView) {
            AddExpenseView(viewModel: viewModel)
        }
        
    }
    
    
    func removeItem(at offsets : IndexSet) {
        viewModel.items.remove(atOffsets: offsets)
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
