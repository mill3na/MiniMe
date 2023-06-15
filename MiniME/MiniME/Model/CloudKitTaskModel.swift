//
//  TaskList.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 13/06/23.
//

import Foundation
import CloudKit

struct Task {
    let title: String
    let id: CKRecord.ID?
//    let minutesTime: Int
//    let hourTime: Int
    let mode: String
    let priority: String
    
    init(title: String, priority: String, mode: String, id: CKRecord.ID? = nil) {
        self.title = title
        self.id = id
//        self.minutesTime = minutesTime
//        self.hourTime = hourTime
        self.mode = mode
        self.priority = priority
    }
    
    func toDictionary() -> [String: Any]{
        return ["title": title, "priority": priority, "mode": mode]
    }
    
    static func fromRecord(_ record: CKRecord) -> Task? {
        
        guard let title = record.value(forKey: "title") as? String, let priority = record.value(forKey: "priority") as? String, let mode = record.value(forKey: "mode") as? String else {
            return nil
        }
        return Task(title: title, priority: priority, mode: mode, id: record.recordID)
    }
}
