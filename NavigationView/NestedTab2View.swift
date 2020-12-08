//
//  NestedTabView2.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct NestedTab2View: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var cartData: FetchedResults<CartData>
  
  var body: some View {
    ZStack {
      List {
        ForEach(cartData){ cart in
          Text(cart.name ?? "Untitled")
        }
        .onDelete(perform: deleteCart)
      }
      Text("Nested Tab 2")
        .foregroundColor(Color.black)
        .navigationBarTitle("Cart Data", displayMode: .inline)
    }
  }
  
  private func saveContext() {
    do {
      try viewContext.save()
    } catch {
      let error = error as NSError
      fatalError("Unresolved error \(error)")
    }
  }
  
  private func deleteCart(offsets: IndexSet) {
    withAnimation{
      offsets.map { cartData [$0] }.forEach(viewContext.delete)
      saveContext()
    }
  }
  
}

struct NestedTabView2_Previews: PreviewProvider {
  static var previews: some View {
    NestedTab2View()
  }
}
