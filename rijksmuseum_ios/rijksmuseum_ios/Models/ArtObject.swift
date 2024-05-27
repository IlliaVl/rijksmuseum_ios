//
//  ArtObject.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

struct ArtObject: Codable, Identifiable {
    let links: Links
    let id, objectNumber, title: String
    let hasImage: Bool
    let principalOrFirstMaker, longTitle: String
    let showImage, permitDownload: Bool
    let webImage, headerImage: ArtImage
}
