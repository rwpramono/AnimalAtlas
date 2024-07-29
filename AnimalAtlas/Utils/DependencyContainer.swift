//
//  DependencyContainer.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

final class DependencyContainer {
    static let shared = DependencyContainer()
    private init() {}

    private let jsonDecoder = JSONDecoder()
    private let urlSession = URLSession(configuration: .ephemeral)

    lazy var networkService: HttpNetwork = URLSessionService(session: urlSession, decoder: jsonDecoder)
    lazy var imageLoaderService: HttpNetwork = ImageLoaderService(session: urlSession)
    lazy var coreDataStack: CoreDataStack = CoreDataStack(.persistent)
}
