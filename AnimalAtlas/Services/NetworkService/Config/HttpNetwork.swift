//
//  HttpNetwork.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation
import Combine

protocol HttpNetwork: AnyObject {
    func execute<T: Codable>(_ apiData: APIDataRequest) -> AnyPublisher<T, Error>
}
