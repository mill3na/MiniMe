//
//  MiniMEApp.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI
import CloudKit

@main
struct MiniMEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            let container = CKContainer(identifier: "iCloud.miniMe")
            CloudKitPocView(viewModel: TaskViewModel(container: container)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
//            AtividadesView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
