//
//  MiniMEApp.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI

@main
struct MiniMEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FeelingSheet()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
