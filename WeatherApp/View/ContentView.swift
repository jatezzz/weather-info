//
//  ContentView.swift
//  LibraryTest
//
//  Created by John Trujillo on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activeView: ActiveView = .none
    @ObservedObject private var viewModel = ViewModel(networkService: RealNetworkService())
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Reemplazar con MapsView") {
                activeView = .mapsView
            }
            
            Button("Reemplazar con OtherFragment") {
                activeView = .otherFragment
            }
            
            Button("Ejecutar petición API") {
                viewModel.fetchCoordinates()
            }
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            }
            
            switch activeView {
            case .mapsView:
                MapsView(viewModel: viewModel)
                    .onAppear {
                        viewModel.fetchCoordinates()
                    }
            case .otherFragment:
                OtherFragment(viewModel: viewModel)
            case .none:
                Text("Seleccione una vista para mostrar")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    ContentView()
}
