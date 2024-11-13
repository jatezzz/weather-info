//
//  NetworkService.swift
//  LibraryTest
//
//  Created by John Trujillo on 13/11/24.
//

import Foundation
import Combine

protocol NetworkService {
    func fetchCoordinates() -> AnyPublisher<CoordinateResponse, Error>
}
