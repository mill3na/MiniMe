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
//
//    @State var primeiravez : Bool = false
//
//    UserDefaults.standard.set(false, forKey: "primeiravez")
//
//    print(UserDefaults.standard.bool(forKey: "has-seen-onboarding"))
//    // Prints: true
//    print(UserDefaults.standard.array(forKey: "favorite-stocks"))
//    // Prints: ["AAPL", "TSLA"]

    @AppStorage("firstTime") var firstTime: Bool = true

    let persistenceController = PersistenceController.shared

    let container = CKContainer(identifier: "iCloud.miniMe")

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if firstTime {
                    OnboardingView().onAppear { firstTime = false }
                } else {
                    AtividadesView()
                }
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
