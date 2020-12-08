//
//  PersistenceUserData.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import Foundation
import CoreData

struct PersistanceUserData {
  static let shared = PersistanceUserData()
  
  let container: NSPersistentContainer
  
  init() {
    container = NSPersistentContainer(name: "UserData")
    
    container.loadPersistentStores { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error: \(error)")
      }
    }
  }
}
