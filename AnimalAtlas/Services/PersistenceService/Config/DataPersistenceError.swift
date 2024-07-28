//
//  DataPersistenceError.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

public enum DataPersistenceError: Error, LocalizedError {
    case invalidEntityName
    case missingContext
    case predicateDataNotFound
    case saveFailed(Error)
    case loadFailed(Error)
    case deleteFailed(Error)
    
    public var errorDescription: String? {
        switch self {
        case .invalidEntityName:
            return "Invalid Entity Name"
        case .missingContext:
            return "Missing Managed Object Context"
        case .predicateDataNotFound:
            return "Predicate Data Entity Not Found"
        case .saveFailed(let error):
            return "Failed to save: \(error.localizedDescription)"
        case .loadFailed(let error):
            return "Failed to load: \(error.localizedDescription)"
        case .deleteFailed(let error):
            return "Failed to delete: \(error.localizedDescription)"
        }
    }
}
