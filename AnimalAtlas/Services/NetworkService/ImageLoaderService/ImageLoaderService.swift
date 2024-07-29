//
//  ImageLoaderService.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import Combine
import Foundation

public class ImageLoaderService: HttpNetwork {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    func execute<T: Codable>(_ apiData: APIDataRequest) -> AnyPublisher<T, Error>  {
        guard let request = apiData.urlRequest else {
            return Fail(error: HttpNetworkError.invalidAPIDataRequest).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response -> T in
                guard let response = response as? HTTPURLResponse else {
                    throw HttpNetworkError.noResponseData
                }
                
                switch response.statusCode {
                case 200 ... 299: return DataCodable(data: data) as! T
                default: throw HttpNetworkError.other(message: "\(response.statusCode)")
                }
            }
            .mapError { errorMessage in
                return errorMessage as? HttpNetworkError ?? HttpNetworkError.other(message: "\(errorMessage.localizedDescription)")
            }
            .eraseToAnyPublisher()

    }
}
