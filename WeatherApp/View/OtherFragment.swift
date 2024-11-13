//
//  OtherFragment.swift
//  LibraryTest
//
//  Created by John Trujillo on 13/11/24.
//

import SwiftUI

struct OtherFragment: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.history, id: \.self) { coord in
            Text("Lat: \(coord.latitude), Lon: \(coord.longitude)")
        }
    }
}
