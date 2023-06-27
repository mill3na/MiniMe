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
    
    func deleteTask(_ recordId: CKRecord.ID) {
        database.delete(withRecordID: recordId) { deletedRecordId, error in
            if let error = error {
                print("ERROR: error while deleting task: \(error).")
            } else {
                self.populateTasks()
            }
        }
        
    }
    
    func saveTask(title: String, priority: String, mode: String, minutesTime: Int) {
        // create a cloud kit record so we can save our tasks based on an enum that tells us what record type it is
        let record = CKRecord(recordType: RecordType.task.rawValue)
        let task = Task(title: title, priority: priority, mode: mode, minutesTime: minutesTime)
        
        // saves the values passed as dictionary
        // the function used as parameter above coverts our values from model to dict
        
        record.setValuesForKeys(task.toDictionary())
        
        // now, save in database!
        self.database.save(record) { newRecord, error in
            if let error = error {
                print("ERROR: error while saving task: \(error).")
            } else {
                if let newRecord = newRecord {
                    if let task = Task.fromRecord(newRecord) {
                        DispatchQueue.main.async {
                            self.items.append(TaskListViewModel(task: task))
                        }
                        
                    }
                    print("Saved as: \(newRecord)")
                }
            }
        }
        
    }
    
    // MARK: -- function to fetch tasks
    func populateTasks(completion: @escaping () -> Void = { }) {
        
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
                            print("ERROR: error populating cloudkit local instance: \(error).")
                        }
                    }
                DispatchQueue.main.async {
                    self.items = taskList.map(TaskListViewModel.init)
                    completion()
                }
//
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    func calculateTotalMinutes(hours: Int, minutes: Int, seconds: Int) -> Int {
            let totalSeconds = calculateTotalSeconds(hours: hours, minutes: minutes, seconds: seconds)
            let totalMinutes = totalSeconds / 60
            return totalMinutes
        }

    func calculateTotalSeconds(hours: Int, minutes: Int, seconds: Int) -> Int {
            let hoursInSeconds = hours * 3600
            let minutesInSeconds = minutes * 60
            return hoursInSeconds + minutesInSeconds + seconds
        }
    
}

struct TaskListViewModel {
    let task: Task
    
    var title: String {
        task.title
    }
    
    var priority: String {
        task.priority
    }
    
    var mode: String {
        task.mode
    }
    
    var minutesTime: Int {
        task.minutesTime
    }
    
    var recordId: CKRecord.ID? {
        task.id
    }
    
    
}
