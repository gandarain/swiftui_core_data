//
//  Tab2View.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct Tab2View: View {
  @State var isNavigationBarHidden: Bool = true
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var loginData: FetchedResults<LoginData>
  
  @FetchRequest(sortDescriptors: [])
  private var cartData: FetchedResults<CartData>
  
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(cartData){ cart in
            Text(cart.name ?? "Untitled")
          }
          .onDelete(perform: deleteTask)
        }
        
        VStack {
          NavigationLink(destination: NestedTab2View()){
            Text("Navigate to nested tab 2")
              .foregroundColor(Color.black)
          }
          
          Button(action: {
            setLogout()
          }) {
            Text("Logout")
          }
        }
      }
      .navigationTitle("Cart Data")
      .navigationBarItems(trailing: Button("Add Cart") {
        addCart()
      })
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
  
  private func setLogout(){
    viewContext.delete(loginData[0])
    saveContext()
  }
  
  private func deleteTask(offsets: IndexSet) {
    withAnimation{
      offsets.map { cartData [$0] }.forEach(viewContext.delete)
      saveContext()
    }
  }
  
  private func addCart(){
    withAnimation {
      let newTask = CartData(context: viewContext)
      newTask.name = "New Cart \(Date())"
      newTask.date = Date()
      
      saveContext()
    }
  }
}

struct Tab2View_Previews: PreviewProvider {
  static var previews: some View {
    Tab2View()
  }
}
