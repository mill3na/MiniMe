//
//  ContentView.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI
import CoreData
import CloudKit

struct ContentView: View {
    
    @StateObject private var viewModel: TaskViewModel
    @State private var title: String = ""
//    @State private var id: String = ""
    
    init(viewModel: TaskViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let task = viewModel.items[index]
            if let recordId = task.recordId {
                viewModel.deleteTask(recordId)
            }
        }
        
    }

    var body: some View {
        let container = CKContainer(identifier: "iCloud.miniMe")
        CloudKitPocView(viewModel: TaskViewModel(container: container)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
 
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        
        let container = CKContainer(identifier: "iCloud.miniMe")
        CloudKitPocView(viewModel: TaskViewModel(container: container)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


