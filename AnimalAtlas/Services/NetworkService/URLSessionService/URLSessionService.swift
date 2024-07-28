//
//  URLSessionService.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation

public class URLSessionService: HttpNetwork {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    func execute<T: Codable>(_ apiData: APIDataRequest) -> AnyPublisher<T, Error> {
        guard let request = apiData.urlRequest else {
            return Fail(error: HttpNetworkError.invalidAPIDataRequest).eraseToAnyPublisher()
        }
        
        return makeDataTaskPublisher(request, type: T.self)
    }
    
    private func makeDataTaskPublisher<T: Codable>(_ urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: urlRequest)
            .tryMap { [weak self] jsonData, response -> T in
                guard let self, let response = response as? HTTPURLResponse else {
                    throw HttpNetworkError.noResponseData
                }
                
                switch response.statusCode {
                case 200 ... 299: return try self.decoder.decode(T.self, from: jsonData)
                default: throw HttpNetworkError.other(message: "\(response.statusCode)")
                }
            }
            .mapError { errorMessage in
                return errorMessage as? HttpNetworkError ?? HttpNetworkError.other(message: "\(errorMessage.localizedDescription)")
            }
            .eraseToAnyPublisher()
    }
}
