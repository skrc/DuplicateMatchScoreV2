//
//  DuplicateMatchScoreApp.swift
//  DuplicateMatchScore
//
//  Created by Sandra K Cureton on 5/26/21.
//

import SwiftUI

@main
struct DuplicateMatchScoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
