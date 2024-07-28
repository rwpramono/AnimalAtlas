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
        
    }
    
    func delete(_ object: FavoriteAnimalPhoto) throws {
        
    }
}
