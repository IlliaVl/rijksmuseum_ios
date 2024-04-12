//
//  RijksmuseumService.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 11.04.2024.
//

import Foundation
import Combine

enum APIError: Error {
    case urlConstructionError
    case networkError
    case decodingError
    //        case networkError(error: URLError)
    //        case decodingError(error: DecodingError)
}

struct RijksmuseumServiceImpl: RijksmuseumService  {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }

    func fetchArtworks(page: Int) -> AnyPublisher<[ArtObject], APIError> {
        guard var urlComponents = URLComponents(string: "https://www.rijksmuseum.nl/api/en/collection") else {
            return Fail(error: .urlConstructionError).eraseToAnyPublisher()
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: "tyvjHkSK"),
            URLQueryItem(name: "p", value: String(page))
        ]
        guard let url = urlComponents.url else {
            return Fail(error: .urlConstructionError).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.networkError
                }
                print("got output") // debug statement
                
                if let dataString = String(data: data, encoding: .utf8) { // debug statement
                    
                    print("got dataString: \n\(dataString)") // debug statement
                    
                } // debug statement
                return data
            }
            .mapError({ erroruu in
                APIError.networkError
            })
            .decode(type: RijksmuseumResponse.self, decoder: JSONDecoder())
            .mapError({ erroruu in
                print(erroruu)
                return APIError.decodingError
            })
            .map { response in
                response.artObjects
            }
            .eraseToAnyPublisher()
    }
}
