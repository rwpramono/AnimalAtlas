//
//  CoreDataError.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

public enum CoreDataError: Error, LocalizedError {
    case missingManagedObjectContext
    case saveFailed(Error)
    case loadFailed(Error)
    
    public var errorDescription: String? {
        switch self {
        case .missingManagedObjectContext:
            return "Missing Managed Object Context"
        case .saveFailed(let error):
            return "Failed to save: \(error.localizedDescription)"
        case .loadFailed(let error):
            return "Failed to load: \(error.localizedDescription)"
        }
    }
}
