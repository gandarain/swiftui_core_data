//
//  SwiftUIView.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct NestedTab1View: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var taskData: FetchedResults<TaskData>
  
  var body: some View {
    ZStack {
      List {
        ForEach(taskData){ task in
          Text(task.name ?? "Untitled")
        }
        .onDelete(perform: deleteTask)
      }
      Text("Nested Tab 1")
        .foregroundColor(Color.black)
        .navigationBarTitle("Todo List", displayMode: .inline)
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

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    NestedTab1View()
  }
}
