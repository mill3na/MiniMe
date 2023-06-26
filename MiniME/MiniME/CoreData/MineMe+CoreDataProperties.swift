//
//  MineMe+CoreDataProperties.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 21/06/23.
//
//

import Foundation
import CoreData


extension MineMe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MineMe> {
        return NSFetchRequest<MineMe>(entityName: "MineMe")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var emotion: String?

}

extension MineMe : Identifiable {

}
