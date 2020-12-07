//
//  ContentView.swift
//  NavigationView
//
//  Created by Panbers on 06/12/20.
//

import SwiftUI

class UserSetting: ObservableObject {
  @Published var isLogin: Bool = false
  
  func setLogin(){
    self.isLogin = true
  }
  
  func setLogout(){
    self.isLogin = false
  }
}

struct ContentView: View {
  @State var isNavigationBarHidden: Bool = true
  @EnvironmentObject var userSetting: UserSetting
  
  var body: some View {
    if !userSetting.isLogin {
      WelcomeView()
    } else {
      BottomTabView()
    }
  }
}

struct WelcomeView: View {
  @State var isNavigationBarHidden: Bool = true
  @EnvironmentObject var userSetting: UserSetting
  
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

struct LoginView: View {
  @State var isNavigationBarHidden: Bool = true
  @EnvironmentObject var userSetting: UserSetting
  
  var body: some View {
    if !userSetting.isLogin {
      ZStack {
        Color.green
        Button(action: {
          userSetting.setLogin()
        }){
          Text("Login Screen")
            .foregroundColor(Color.black)
        }
      }
      .navigationBarTitle("Hidden Title")
      .navigationBarHidden(self.isNavigationBarHidden)
      .onAppear {
        self.isNavigationBarHidden = true
      }
    } else {
      BottomTabView()
    }
  }
}

struct BottomTabView: View {
  @State private var selection = 0
  @EnvironmentObject var userSetting: UserSetting
  
  var body: some View {
    TabView {
      Tab1()
        .tabItem {
          Image(systemName: "house.fill")
          Text("Tab1")
        }
        .tag(0)
      
      Tab2()
        .tabItem {
          Image(systemName: "cart.fill")
          Text("Tab2")
        }
        .tag(1)
    }
    .accentColor(Color.red)
  }
}


struct Tab1: View {
  @State var isNavigationBarHidden: Bool = true
  
  var body: some View {
    ZStack {
      Color.blue
      NavigationLink(destination: NestedViewTab1()) {
        Text("Tab1")
          .foregroundColor(Color.black)
          .navigationBarTitle("Hidden Title")
          .navigationBarHidden(self.isNavigationBarHidden)
          .onAppear {
            self.isNavigationBarHidden = true
          }
      }
    }
  }
}

struct Tab2: View {
  @State var isNavigationBarHidden: Bool = true
  @EnvironmentObject var userSetting: UserSetting
  
  var body: some View {
    ZStack {
      Color.yellow
      VStack {
        NavigationLink(destination: NestedViewTab2()){
          Text("Tab2")
            .foregroundColor(Color.black)
            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
              self.isNavigationBarHidden = true
            }
        }
        
        Button(action: {
          userSetting.setLogout()
        }) {
          Text("Logout")
        }
      }
    }
  }
}

struct NestedViewTab1: View {
  var body: some View {
    ZStack {
      Color.green
      Text("Nested Tab 1")
        .foregroundColor(Color.black)
        .navigationBarTitle("Hidden Title", displayMode: .inline)
    }
  }
}

struct NestedViewTab2: View {
  var body: some View {
    ZStack {
      Color.pink
      Text("Nested Tab 2")
        .foregroundColor(Color.black)
        .navigationBarTitle("Hidden Title", displayMode: .inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
