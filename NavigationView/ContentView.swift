//
//  ContentView.swift
//  NavigationView
//
//  Created by Panbers on 06/12/20.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(entity: LoginData.entity(), sortDescriptors: [])
  private var loginData: FetchedResults<LoginData>
  
  var body: some View {
    if loginData.count == 0 {
      WelcomeView()
    } else {
      BottomTabView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
