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

    let container = CKContainer(identifier: "iCloud.miniMe")

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AtividadesView()
            }
            .onAppear {
                Notification.checkForPermission()
            }
//            OnboardingView()
//            NovAtividade(viewModel: TaskViewModel(container: container))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
