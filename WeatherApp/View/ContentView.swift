//
//  ContentView.swift
//  LibraryTest
//
//  Created by John Trujillo on 12/11/24.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    @State private var isMapsViewActive = false
    @State private var isOtherFragmentActive = false
    @ObservedObject private var viewModel = ViewModel(networkService: RealNetworkService())
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Reemplazar con MapsView") {
                isMapsViewActive.toggle()
            }
            
            Button("Reemplazar con OtherFragment") {
                isOtherFragmentActive.toggle()
            }
            
            Button("Ejecutar petición API") {
                viewModel.fetchCoordinates()
            }
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            }
            
            if isMapsViewActive {
                MapsView(viewModel: viewModel)
                    .onAppear() {
                        viewModel.fetchCoordinates()
                    }
            } else if isOtherFragmentActive {
                OtherFragment(viewModel: viewModel)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
