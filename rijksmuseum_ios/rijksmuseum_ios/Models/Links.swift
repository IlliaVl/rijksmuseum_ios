//
//  Links.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

struct Links: Codable {
    let linksSelf, web: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case web
    }
}
