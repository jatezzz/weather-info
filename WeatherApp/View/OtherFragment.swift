//
//  OtherFragment.swift
//  LibraryTest
//
//  Created by John Trujillo on 13/11/24.
//

import SwiftUI

struct OtherFragment: View {
    @ObservedObject var viewModel: ViewModel
    private let dateFormatter: DateFormatter

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .short
        self.dateFormatter.timeStyle = .medium
    }
    
    var body: some View {
        List(viewModel.history, id: \.self) { coord in
            VStack(alignment: .leading) {
                Text("Lat: \(coord.latitude), Lon: \(coord.longitude)")
                Text("Saved on: \(dateFormatter.string(from: coord.timestamp))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
