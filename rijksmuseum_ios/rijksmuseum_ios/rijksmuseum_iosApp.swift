//
//  rijksmuseum_iosApp.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 10.04.2024.
//

import SwiftUI

@main
struct rijksmuseum_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: RijksmuseumServiceImpl(session: URLSession.shared))
        }
    }
}
