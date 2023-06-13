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
}
