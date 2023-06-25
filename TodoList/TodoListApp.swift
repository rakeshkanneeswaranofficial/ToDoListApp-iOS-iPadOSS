//
//  TodoListApp.swift
//  TodoList
//
//  Created by Apple on 24/06/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
