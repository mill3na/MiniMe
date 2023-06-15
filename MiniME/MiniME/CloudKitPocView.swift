//
//  ContentView.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI
import CoreData
import CloudKit

struct CloudKitPocView: View {
    
    @StateObject private var viewModel: TaskViewModel
    @State private var title: String = ""
    @State private var priority: String = ""
    @State private var mode: String = ""
    @State private var minutesTime: String = ""
    
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
        NavigationView {
            VStack {
                TextField("Task title", text: $title)
                    .textFieldStyle(.roundedBorder)
                TextField("Task priority", text: $priority)
                    .textFieldStyle(.roundedBorder)
                TextField("Task mode", text: $mode)
                    .textFieldStyle(.roundedBorder)
                TextField("Task minute time", text: $minutesTime)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    
                    guard let minutesTime = try? Int(minutesTime, format: .number) else { return }
                    
                    // MARK: -- make pop up warning with errors
                    
                    viewModel.saveTask(title: title, priority: priority, mode: mode, minutesTime: minutesTime)
                    self.title = ""
                    self.priority = ""
                    self.mode = ""
                    self.minutesTime = ""
                    
                } label: {
                    Text("Save")
                }.disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                
                Spacer()
                
                List {
                    ForEach(viewModel.items, id: \.recordId) { item in
                        HStack {
                            Text("Nome: \(item.title), Prioridade: \(item.priority), Modo: \(item.mode), time: \(item.minutesTime) min")
                        }
                    }.onDelete(perform: deleteItem)
                }
                    .navigationTitle("CloudKit Poc")
            }
            .padding()
            .onAppear {
                viewModel.populateTasks()
//                print("ITEMS: \(viewModel.items)")
            }
        }
    }
}


struct CloudKitPocView_Previews: PreviewProvider {

    
    static var previews: some View {
        
        let container = CKContainer(identifier: "iCloud.miniMe")
        CloudKitPocView(viewModel: TaskViewModel(container: container)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
