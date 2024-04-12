//
//  RijksmuseumService.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

import Combine

protocol RijksmuseumService {
    func fetchArtworks(page: Int) -> AnyPublisher<[ArtObject], APIError>
}
