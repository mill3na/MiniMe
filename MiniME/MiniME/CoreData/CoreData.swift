//
//  CoreData.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 21/06/23.
//

import Foundation
import CoreData

func fetchMineMe(context: NSManagedObjectContext) -> MineMe? {
    do {
        let mineMeRequest = MineMe.fetchRequest() as NSFetchRequest<MineMe>
        return try context.fetch(mineMeRequest).first
    } catch {
        print("Error while fetching MineMe.")
        print(error)
        return nil
    }
}

func saveName(context: NSManagedObjectContext, name: String) {
    var nameMine = MineMe(context: context)
    nameMine.name = name
    nameMine.id = UUID()
    nameMine.emotion = "original"
    
    do {
        try context.save()
        print("✅ CORE DATA: Name successfully added.")
    }
    catch {
        print(error.localizedDescription)
        print("Error: was not able to add the name at core data.")
    }
}

func filterById(id: UUID, context: NSManagedObjectContext) -> MineMe? {
    var miniMe: MineMe?
    let fetch = MineMe.fetchRequest()
    fetch.predicate = NSPredicate(format: "id == %@", "\(id)")
    do {
        miniMe = try context.fetch(fetch).first
        return miniMe
    } catch {
        print("Not able to find minime bt the given id \(id)")
    }
    return miniMe
}

func updateMiniMe(emotion: String, context: NSManagedObjectContext) {
    let miniMe = fetchMineMe(context: context)
    if let mineMeToUpdate = miniMe {
        mineMeToUpdate.emotion = emotion
        do {
            try context.save()
            print("Emotion successfully updated! Current image filename: \(mineMeToUpdate.emotion)")
        } catch  {
            print("Not able to change mineMe emotion.")
        }
    } else {
        print("MineMe id not found.")
    }
}

func deleteMineMe(id: UUID, context: NSManagedObjectContext) {
    let mineMe = filterById(id: id, context: context)
    if let MineMeToDelete = mineMe  {
        context.delete(MineMeToDelete)
        do {
            try context.save()
            print("MineMe was successfully deleted and the context was saved.")
        }
        catch{
            print("Something went wrong while deleting mineMe and saving the context.")
            print(error)
        }
    } else {
        print("No mineMe as deleted because there is no clothe with the given id.")
    }
}

func printSavedMiniMes (context: NSManagedObjectContext) {
    if let mineMe = fetchMineMe(context: context) {
        print("✨COREDATA DATA id: \(mineMe.id), name: \(mineMe.name), emotion: \(mineMe.emotion).")
    } else {
        print("There is no miniMes saved at the core data.")
    }
}
