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
            if viewModel.isLoading {
                Color.black.opacity(0.3).ignoresSafeArea()
                ProgressView()
            }
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                Button("Fetch") {
                    viewModel.fetchArtworks(page: 0)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(service: RijksmuseumServiceImpl(session: URLSession.shared))
}
