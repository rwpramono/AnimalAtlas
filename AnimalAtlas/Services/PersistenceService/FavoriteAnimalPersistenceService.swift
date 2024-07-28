//
//  FavoriteAnimalPersistenceService.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import CoreData
import Foundation

class FavoriteAnimalPersistenceService: DataPersistence {
    typealias T = FavoriteAnimalPhoto
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func load() throws -> [FavoriteAnimalPhoto] {
        let request: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
        let dataEntitiy = try coreDataStack.viewContext.fetch(request)
        return dataEntitiy.compactMap { entity in
            guard let id = entity.id,
                  let name = entity.animalName,
                  let url = entity.photoUrl else { return nil }
            return FavoriteAnimalPhoto(id: id, name: name, photoStringURL: url)
        }
    }
    
    func add(_ object: FavoriteAnimalPhoto) throws {
        let entity = FavoriteEntity(context: coreDataStack.viewContext)
        entity.id = object.id
        entity.animalName = object.name
        entity.photoUrl = object.photoStringURL
        try coreDataStack.viewContext.save()
    }
    
    func delete(_ object: FavoriteAnimalPhoto) throws {
        let request: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", object.id)
        
        guard let results = try coreDataStack.viewContext.fetch(request).first else {
            throw DataPersistenceError.deleteFailed(DataPersistenceError.predicateDataNotFound)
        }
        coreDataStack.viewContext.delete(results)
        try coreDataStack.viewContext.save()
    }
}
