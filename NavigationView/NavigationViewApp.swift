//
//  NavigationViewApp.swift
//  NavigationView
//
//  Created by Panbers on 06/12/20.
//

import SwiftUI

@main
struct NavigationViewApp: App {
  let persistenceContainer = PersistanceUserData.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
    }
  }
}
