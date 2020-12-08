//
//  LoginView.swift
//  NavigationView
//
//  Created by Panbers on 08/12/20.
//

import SwiftUI

struct LoginView: View {
  @State var isNavigationBarHidden: Bool = true
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var userData: FetchedResults<LoginData>
  
  var body: some View {
    ZStack {
      Color.green
      Button(action: {
        setLogin()
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
  }
  
  private func saveContext() {
    do {
      try viewContext.save()
    } catch {
      let error = error as NSError
      fatalError("Unresolved error \(error)")
    }
  }
  
  private func setLogin(){
    let newUser = LoginData(context: viewContext)
    newUser.isLogin = true
    newUser.userToken = "JWT_TOKEN"
    
    saveContext()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
