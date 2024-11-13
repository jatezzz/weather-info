//
//  MockNetworkService.swift
//  WeatherApp
//
//  Created by John Trujillo on 13/11/24.
//

import Combine
import Foundation

class MockNetworkService: NetworkService {
    var shouldReturnError = false
    
    func fetchCoordinates() -> AnyPublisher<CoordinateResponse, Error> {
        if shouldReturnError {
            return Fail(error: URLError(.badServerResponse))
                .eraseToAnyPublisher()
        } else {
            let response = CoordinateResponse(
                coord: Coord(lon: -0.1278, lat: 51.5074),
                weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
                base: "stations",
                main: Main(temp: 280.32, feelsLike: 278.44, tempMin: 279.15, tempMax: 281.15, pressure: 1020, humidity: 81, seaLevel: 1020, grndLevel: 1018),
                visibility: 10000,
                wind: Wind(speed: 1.5, deg: 350),
                clouds: Clouds(all: 1),
                dt: 1605182400,
                sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1605159200, sunset: 1605192000),
                timezone: 0,
                id: 2643743,
                name: "London",
                cod: 200
            )
            return Just(response)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
