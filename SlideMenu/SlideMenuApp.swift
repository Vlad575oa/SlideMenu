//
//  SlideMenuApp.swift
//  SlideMenu
//
//  Created by user on 11.04.2023.
//

import SwiftUI

@main
struct SlideMenuApp: App {
  @StateObject var viewmodel: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(viewmodel)
        }
    }
}
