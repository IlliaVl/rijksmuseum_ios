//
//  URLSessionProtocol.swift
//  rijksmuseum_ios
//
//  Created by Illia Vlasov on 12.04.2024.
//

import Foundation
import Combine

protocol URLSessionProtocol {
    func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}
