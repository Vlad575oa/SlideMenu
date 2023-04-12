//
//  ViewModel.swift
//  SlideMenu
//
//  Created by user on 11.04.2023.
//


import SwiftUI

class ViewModel: ObservableObject {
  @Published  var isOpen: Bool = false
  @Published  var sideButton: Bool = true
  @Published  var selectedItem: TabIcon = .home
  @Published  var toggleAction = false
}

struct sideBar: Identifiable {
  var id = UUID()
  var icon: String
  var titel: String
  var tab: TabIcon
}

var sidebar = [
  sideBar(icon: "rectangle.stack", titel: "Tutorials", tab: .home),
  sideBar(icon: "star", titel: "Favorite", tab: .maginf),
  sideBar(icon: "square.and.arrow.down", titel: "Downloads", tab: .bell),
  sideBar(icon: "ellipsis.message", titel: "Messages", tab: .rect)]


enum TabIcon: String {
  case home
  case maginf
  case bell
  case rect
}

struct Colors: Identifiable {
  var id = UUID()
  var acolors: String
}

var arrayColor = [Colors(acolors: "c1"),
                  Colors(acolors: "c2"),
                  Colors(acolors: "c3")]


struct Project: Identifiable {
  var id = UUID()
  var color: Color
  var titel: String
}


var projects = [
Project(color: .red, titel: "TabBr"),
Project(color: .purple, titel: "api jeston"),
Project(color: .yellow, titel: "side bar"),
Project(color: .blue, titel: "todo app"),
Project(color: .cyan, titel: "video edier")
]

struct DarkToggle: View {
  @EnvironmentObject var vm: ViewModel

  var body: some View {
    HStack {
      Image(systemName: "gearshape")
        .foregroundColor(.gray)
      Text("Dark Mode")
        .foregroundColor(.gray)
      Spacer()
      Toggle(isOn: $vm.toggleAction, label:  {

      })
      .padding()
      .foregroundColor(.white)
    }
  }
}
