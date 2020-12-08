//
//  BottomTabView.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct BottomTabView: View {
  @State private var selection = 0
  
  var body: some View {
    TabView {
      Tab1View()
        .tabItem {
          Image(systemName: "house.fill")
          Text("Tab1")
        }
        .tag(0)
      
      Tab2View()
        .tabItem {
          Image(systemName: "cart.fill")
          Text("Tab2")
        }
        .tag(1)
    }
    .accentColor(Color.red)
  }
}

struct BottomTabView_Previews: PreviewProvider {
  static var previews: some View {
    BottomTabView()
  }
}
