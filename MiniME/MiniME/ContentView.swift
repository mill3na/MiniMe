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

    var body: some View {
        NavigationView {
            VStack {
                TextField("Task title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    viewModel.saveTask(title: title)
                    self.title = ""
                    
                } label: {
                    Text("Save")
                }
                
                Spacer()
                
                    .navigationTitle("CloudKit Poc")
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {

    
    static var previews: some View {
        
        let container = CKContainer(identifier: "iCloud.miniMe")
        ContentView(viewModel: TaskViewModel(container: container)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
