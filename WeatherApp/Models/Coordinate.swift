//
//  Coordinate.swift
//  WeatherApp
//
//  Created by John Trujillo on 13/11/24.
//

import Foundation
import Combine
import CoreLocation

struct Coordinate: Identifiable, Hashable, Codable {
    let id: UUID
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
