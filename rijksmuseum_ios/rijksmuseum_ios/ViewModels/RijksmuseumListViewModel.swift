//
//  RijksmuseumListViewModel.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

import Foundation
import Combine

class RijksmuseumListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var artworks: [ArtObject] = []
    
    private let service: RijksmuseumService
    private var subscriptions = Set<AnyCancellable>()

    init(service: RijksmuseumService) {
        self.service = service
    }
    
    func fetchArtworks(page: Int) {
        isLoading = true
        service.fetchArtworks(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case let .failure(error) = completion {
                    print(error)
                    // Handle errors here (e.g., show an alert)
                }
            }, receiveValue: { [weak self] artworks in
                guard let self = self else { return }
                self.artworks = artworks
            })
            .store(in: &subscriptions)
    }

}
