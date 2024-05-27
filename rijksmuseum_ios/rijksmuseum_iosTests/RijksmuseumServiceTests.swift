//
//  RijksmuseumServiceTests.swift
//  rijksmuseum_iosTests
//
//  Created by Illia Vlasov on 13.04.2024.
//

import Foundation
import Quick
import Combine
import Nimble
import XCTest

class RijksmuseumServiceTests: QuickSpec {
    
    var subscriptions = Set<AnyCancellable>()
    
    override class func spec() {
//        var mockSession: MockURLSessionProtocol!
        var session: URLSession!
        var service: RijksmuseumService!
        
        beforeEach {
            let config = URLSessionConfiguration.ephemeral
            config.protocolClasses = [MockURLProtocol1.self]
            session = URLSession(configuration: config)
            service = RijksmuseumServiceImpl(session: session)
        }
        
        it("fetches artworks successfully") {
            service.testCall().sink { skdnfknsdf in
                print(skdnfknsdf)
            } receiveValue: { asdfasd in
                print(asdfasd)
            }

//            let mockData = "This is some mock data".data(using: .utf8)!
//            mockSession.stub(mockSession.dataTaskPublisher(for: any()), return: Just(mockData).setFailureType(to: URLError.self))
            
            // Call fetchArtworks and verify results
            // ... (test logic)
        }
//        
//        it("handles network errors") {
//            mockSession.stub(mockSession.dataTaskPublisher(for: any()), return: Fail(error: URLError(.cancelled)).eraseToAnyPublisher())
//            
//            // Call fetchArtworks and verify error handling
//            // ... (test logic)
//        }
        
        describe("Some test") {
            // this is the URL we expect to call
            let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")
            
            // attach that to some fixed data in our protocol handler
//            URLProtocolMock.testURLs = [url: Data("Hacking with Swift!".utf8)]
            
            // now set up a configuration to use our mock
            let config = URLSessionConfiguration.ephemeral
            config.protocolClasses = [MockURLProtocol1.self]
            
            // and create the URLSession from that
//            let session = URLSession(configuration: config)
            var session: URLSession!
                
            beforeEach {
                session = URLSession(configuration: config)
            }
        }
//        
//        describe("Some test") {
//            var subscriptions = Set<AnyCancellable>()
//            var mockSession: MockURLSessionProtocol!
//
//            beforeEach {
//                mockSession = MockURLSessionProtocol()
//            }
//
//            it("returns mock data when configured") {
//                let mockData = "This is some mock data".data(using: .utf8)!
//                mockSession.configure(data: mockData)
//
//                let publisher = mockSession.dataTaskPublisher(for: URL(string: "https://example.com")!)
//
//                // Use XCTest expectations or Nimble matchers to verify the data
////                publisher
////                    .sink(receiveCompletion: { _ in },
////                          receiveValue: { data in
//////                        expect(data).to(equal(mockData))
////                    })
////                    .store(in: &subscrptions)
//            }
//            
//            it("returns mock error when configured") {
//                let mockError = URLError(.cancelled)
//                let mockData = "This is some mock data".data(using: .utf8)!
//                mockSession.configure(data: mockData, error: mockError)
//
//                let publisher = mockSession.dataTaskPublisher(for: URL(string: "https://example.com")!)
//
//                // Use XCTest expectations or Nimble matchers to verify the error
//                publisher.sink { completion in
//                    expect(completion).to(matchError<URLError>(mockError))
////                    expect(completion).to(matchError(mockError))
//                } receiveValue: { _ in
//                    XCTFail("Expected an error, but received data instead")
//                }.store(in: &subscriptions)
//
////                publisher
////                    .sink(receiveCompletion: { completion in
////                        expect(completion).to(matchError(mockError))
////                    },
////                          receiveValue: { _ in
////                        XCTFail("Expected an error, but received data instead")
////                    })
////                    .store(in: &subscriptions)
//            }
//        }
        
//        describe("MockURLSessionProtocol") {
//            var subscriptions = Set<AnyCancellable>()
//            var mockSession: MockURLSessionProtocol!
//            
//            beforeEach {
//                mockSession = MockURLSessionProtocol()
//            }
//            
//            it("returns mock data when configured") {
//                let mockData = "This is some mock data".data(using: .utf8)!
//                mockSession.configure(data: mockData)
//                
//                let publisher = mockSession.dataTaskPublisher(for: URL(string: "https://example.com")!)
//                
//                // Use XCTest expectations or Nimble matchers to verify the data
////                publisher
////                    .sink(receiveCompletion: { _ in },
////                          receiveValue: { data in
//////                        expect(data).to(equal(mockData))
////                    })
////                    .store(in: &subscrptions)
//            }
//            
//            it("returns mock error when configured") {
//                let mockError = URLError(.cancelled)
//                let mockData = "This is some mock data".data(using: .utf8)!
//                mockSession.configure(data: mockData, error: mockError)
//                
//                let publisher = mockSession.dataTaskPublisher(for: URL(string: "https://example.com")!)
//                
//                // Use XCTest expectations or Nimble matchers to verify the error
//                publisher
//                    .sink(receiveCompletion: { completion in
//                        expect(completion).to(matchError(mockError))
//                    },
//                          receiveValue: { _ in
//                        XCTFail("Expected an error, but received data instead")
//                    })
//                    .store(in: &subscriptions)
//            }
//        }

    }
}

//class MockURLSessionProtocol: URLSessionProtocol {
//    private var mockData: Data?
//    private var mockError: Error?
//    
//    func configure(data: Data?, error: Error? = nil) {
//        self.mockData = data
//        self.mockError = error
//    }
//    
//    func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher {
//        if let error = mockError {
//            return Fail(error: error).eraseToAnyPublisher()
//        } else if let data = mockData {
//            return Just(data).setFailureType(to: URLError.self).eraseToAnyPublisher()
//        } else {
//            fatalError("MockURLSessionProtocol not configured properly")
//        }
//    }
//}

class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true 
    }
    
    override class func canInit(with task: URLSessionTask) -> Bool {
        return true 
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
    }
    
    override func stopLoading() {
        
    }
}
