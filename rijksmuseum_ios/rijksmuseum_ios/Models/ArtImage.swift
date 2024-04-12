//
//  ArtImage.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

struct ArtImage: Codable {
    let guid: String
    let offsetPercentageX, offsetPercentageY, width, height: Int
    let url: String
}
