//
//  ViewModelTests.swift
//  WeatherApp
//
//  Created by John Trujillo on 13/11/24.
//

import XCTest
import Combine
@testable import WeatherApp

class ViewModelTests: XCTestCase {
    var viewModel: ViewModel!
    var mockNetworkService: MockNetworkService!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = ViewModel(networkService: mockNetworkService)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchCoordinatesSuccess() {
        mockNetworkService.shouldReturnError = false

        let expectation = XCTestExpectation(description: "Coordinates fetched successfully")

        viewModel.fetchCoordinates()
        
        viewModel.$coordinates
            .dropFirst()
            .sink { coordinates in
                XCTAssertEqual(coordinates.count, 1)
                XCTAssertEqual(coordinates.first?.latitude, 51.5074)
                XCTAssertEqual(coordinates.first?.longitude, -0.1278)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchCoordinatesFailure() {
        mockNetworkService.shouldReturnError = true

        let expectation = XCTestExpectation(description: "Error fetching coordinates")

        viewModel.fetchCoordinates()

        viewModel.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertNotNil(errorMessage)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
}
