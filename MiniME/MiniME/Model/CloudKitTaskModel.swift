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
    let minutesTime: Int
//    let hourTime: Int
    let mode: String
    let priority: String
    var startTime: Date?
    
    init(title: String, priority: String, mode: String, minutesTime: Int, startTime: Date? = nil, id: CKRecord.ID? = nil) {
        self.title = title
        self.id = id
        self.minutesTime = minutesTime
        self.startTime = startTime
//        self.hourTime = hourTime
        self.mode = mode
        self.priority = priority
    }
    
    func toDictionary() -> [String: Any]{
        return ["title": title, "priority": priority, "mode": mode, "minutesTime": minutesTime, "startTime" : startTime ]
    }
    
    static func fromRecord(_ record: CKRecord) -> Task? {
        
        guard let title = record.value(forKey: "title") as? String, let priority = record.value(forKey: "priority") as? String, let mode = record.value(forKey: "mode") as? String, let minutesTime = record.value(forKey: "minutesTime") as? Int else {
            return nil
        }
        let startTime = record.value(forKey: "startTime") as? Date
        return Task(title: title, priority: priority, mode: mode, minutesTime: minutesTime, startTime: startTime, id: record.recordID)
    }
}
