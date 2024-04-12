//
//  ContentView.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 10.04.2024.
//

import SwiftUI
import Combine

var subscriptions = Set<AnyCancellable>()
struct ContentView: View {
    

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Fetch") {
                let service = RijksmuseumService()
                
                service.fetchArtworks(page: 1)
                    .sink(receiveCompletion: { completion in
                        if case let .failure(error) = completion {
                            print(error)
                        }
                    }, receiveValue: { artworks in
                        print(artworks) // Array of Artwork objects
                    })
                    .store(in: &subscriptions)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
