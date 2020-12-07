//
//  NavigationViewApp.swift
//  NavigationView
//
//  Created by Panbers on 06/12/20.
//

import SwiftUI

@main
struct NavigationViewApp: App {
  @StateObject var environmentObject = UserSetting()
  
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(environmentObject)
    }
  }
}
