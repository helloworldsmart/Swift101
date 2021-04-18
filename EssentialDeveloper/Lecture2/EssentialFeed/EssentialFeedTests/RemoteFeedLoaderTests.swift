//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Michael on 2021/4/18.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "https://www.google.com/")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
//        let client = HTTPClient()
//        let client = HTTPClient.shared
        let client = HTTPClientSpy()
//        HTTPClient.shared = client
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // 05:08 我 build success ?
        // 07:08 我 build fail ?
//        let client = HTTPClient()
//        let client = HTTPClient.shared
        let client = HTTPClientSpy()
//        HTTPClient.shared = client
        let sut = RemoteFeedLoader(client: client)
        sut.load()

        XCTAssertNil(client.requestedURL)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
