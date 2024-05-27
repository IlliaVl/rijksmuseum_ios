//
//  ContentView.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 10.04.2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var viewModel: RijksmuseumListViewModel
    
    init(service: RijksmuseumService) {
        self._viewModel = StateObject(wrappedValue: RijksmuseumListViewModel(service: service))
    }
    
    var body: some View {
        ZStack {
            if !viewModel.artworks.isEmpty {
                List(viewModel.artworks) { artObject in
                    ArtObjectRow(artObject: artObject)
                }
                .listStyle(PlainListStyle())
            }
            if viewModel.isLoading {
                ZStack {
                    Color.black.opacity(0.3).ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.8))
                        .frame(width: 150, height: 150)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                        .scaleEffect(2.0)
                }
                .opacity(viewModel.isLoading ? 1 : 0)
            }
        }
        .onAppear {
            viewModel.fetchArtworks(page: 0)
        }
        .animation(.easeInOut(duration: 0.2), value: viewModel.isLoading)
    }
}

struct ArtObjectRow: View {
    let artObject: ArtObject
    
    var body: some View {
        HStack {
            if let url = URL(string: artObject.webImage.url) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } else if phase.error != nil {
                        Color.red // Indicates an error
                            .frame(width: 50, height: 50)
                    } else {
                        ProgressView() // Indicates loading
                            .frame(width: 50, height: 50)
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(artObject.title)
                    .font(.headline)
                Text(artObject.principalOrFirstMaker)
                    .font(.subheadline)
            }
        }
    }
}


#Preview {
    ContentView(service: RijksmuseumServiceImpl(session: URLSession.shared))
}
