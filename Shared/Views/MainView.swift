//
//  MainView.swift
//  Flix
//
//  Created by Conrad Taylor on 6/1/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct MainView: View {
  var body: some View {
    TabView {
      MovieListView()
        .tabItem {
          Label("Movies", systemImage: "film")
        }
      
      UserListView()
        .tabItem {
          Label("Users", systemImage: "person.3")
        }
    }
  }
}

@available(iOS 15.0, *)
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
