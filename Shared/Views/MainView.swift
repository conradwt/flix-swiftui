//
//  MainView.swift
//  Flix
//
//  Created by Conrad Taylor on 6/1/21.
//

import SwiftUI

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

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
