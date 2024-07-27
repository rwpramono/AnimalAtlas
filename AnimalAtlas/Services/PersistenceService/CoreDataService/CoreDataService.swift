//
//  CoreDataService.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import CoreData
import Foundation

class CoreDataService: DataPersistence {
    private let container: NSPersistentContainer

    init(containerName: String) {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    func save<T: Codable>(_ data: T) throws {
        let context = container.viewContext
        let entity = NSEntityDescription.entity(forEntityName: String(describing: T.self), in: context)!
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        try context.save()
    }

    func load<T: Codable>(_ type: T.Type) throws -> T {
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: String(describing: T.self))
        return try context.fetch(fetchRequest) as! T
    }

    func delete<T: Codable>(_ data: T) throws {

    }
}
