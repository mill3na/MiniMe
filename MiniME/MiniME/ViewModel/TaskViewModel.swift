//
//  TaskViewModel.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 13/06/23.
//

import Foundation
import CloudKit

enum RecordType: String {
    case task = "Task"
}

// MARK: -- have to make sure that the user is logged in the icloud account so we can save things! 

class TaskViewModel: ObservableObject {
    private var database: CKDatabase
    private var container: CKContainer
    
    @Published var items: [TaskListViewModel] = []
    
    init(container: CKContainer) {
        self.container = container
        self.database = self.container.publicCloudDatabase // pubic let us read the values. Private requires an account
    }
    
    func saveTask(title: String) {
        // create a cloud kit record so we can save our tasks based on an enum that tells us what record type it is
        let record = CKRecord(recordType: RecordType.task.rawValue)
        let task = Task(title: title)
        
        // saves the values passed as dictionary
        // the function used as parameter above coverts our values from model to dict
        
        record.setValuesForKeys(task.toDictionary())
        
        // now, save in database!
        self.database.save(record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let newRecord = newRecord {
                    print("Saved as: \(newRecord)")
                }
            }
        }
        
    }
    
    // MARK: -- function to fetch tasks
    func populateTasks() {
        
        var taskList: [Task] = []
        //predicate is true because we want to get everything
        var query = CKQuery(recordType: RecordType.task.rawValue, predicate: NSPredicate(value: true))
        
        database.fetch(withQuery: query) { result in
            switch result {
            case .success(let result):
//                 these results return an array of tuples (help)
                result.matchResults.compactMap{ $0.1 } // gets the first element of the tuple
                    .forEach {
                        switch $0 {
                        case .success(let record):
                            // print(record) // finally gets the record here, but still not a task. We gotta covert
                            if let tasks = Task.fromRecord(record) {
                                taskList.append(tasks)
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                DispatchQueue.main.async {
                    self.items = taskList.map(TaskListViewModel.init)
                }
//
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
}

struct TaskListViewModel {
    let task: Task
    
    var title: String {
        task.title
    }
    
    var recordId: CKRecord.ID? {
        task.id
    }
    
    
}
