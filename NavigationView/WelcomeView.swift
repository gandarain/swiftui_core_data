//
//  WelcomeView.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct WelcomeView: View {
  @State var isNavigationBarHidden: Bool = true
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.red
        NavigationLink(destination: LoginView()) {
          Text("Welcome Screen")
            .foregroundColor(Color.black)
        }
      }
      .navigationBarTitle("Hidden Title")
      .navigationBarHidden(self.isNavigationBarHidden)
      .onAppear {
        self.isNavigationBarHidden = true
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
