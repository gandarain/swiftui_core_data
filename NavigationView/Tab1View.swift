//
//  Tab1View.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct Tab1View: View {
  @State var isNavigationBarHidden: Bool = true
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var taskData: FetchedResults<TaskData>
  
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(taskData){ task in
            Text(task.name ?? "Untitled")
          }
          .onDelete(perform: deleteTask)
        }
        NavigationLink(destination: NestedTab1View()) {
          Text("Navigate to nested tab 1")
            .foregroundColor(Color.black)
        }
      }
      .navigationTitle("Todo List")
      .navigationBarItems(trailing: Button("Add Task") {
        addTask()
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
  
  private func deleteTask(offsets: IndexSet) {
    withAnimation{
      offsets.map { taskData [$0] }.forEach(viewContext.delete)
      saveContext()
    }
  }
  
  private func addTask(){
    withAnimation {
      let newTask = TaskData(context: viewContext)
      newTask.name = "New Task \(Date())"
      newTask.date = Date()
      
      saveContext()
    }
  }
}
struct Tab1View_Previews: PreviewProvider {
  static var previews: some View {
    Tab1View()
  }
}
