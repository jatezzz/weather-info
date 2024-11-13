//
//  MapsView.swift
//  LibraryTest
//
//  Created by John Trujillo on 13/11/24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.coordinates) { location in
            MapPin(coordinate: location.coordinate, tint: .blue)
        }
        .onChange(of: viewModel.coordinates) { newCoordinates in
            if let firstCoordinate = newCoordinates.first {
                region.center = firstCoordinate.coordinate
            }
        }
    }
}
