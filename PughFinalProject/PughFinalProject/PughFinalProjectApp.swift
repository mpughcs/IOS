//
//  PughFinalProjectApp.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/6/23.
//

import SwiftUI
// this is the driver class that will be used to run the app
@main
struct PughFinalProjectApp: App {
    var body: some Scene {
        let persistentContainer = PersistentController.shared
        WindowGroup {
            ContentView().environment(\.managedObjectContext,
            persistentContainer.container.viewContext)
        }
    }
}
