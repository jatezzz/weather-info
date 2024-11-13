//
//  ViewModel.swift
//  LibraryTest
//
//  Created by John Trujillo on 13/11/24.
//

import Foundation
import Combine
import CoreLocation
class ViewModel: ObservableObject {
    @Published var coordinates: [Coordinate] = []
    @Published var history: [Coordinate] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        loadHistory()
    }
    
    func fetchCoordinates() {
        DispatchQueue.main.async {
            self.isLoading = true // Start loading on the main thread
        }
        networkService.fetchCoordinates()
            .map { response in
                Coordinate(id: UUID(), latitude: response.coord.lat, longitude: response.coord.lon)
            }
            .sink(receiveCompletion: { [weak self] completion in
                DispatchQueue.main.async {
                    self?.isLoading = false // Stop loading on the main thread
                    if case .failure(let error) = completion {
                        self?.errorMessage = "Error fetching coordinates: \(error.localizedDescription)"
                    }
                }
            }, receiveValue: { [weak self] coordinate in
                DispatchQueue.main.async {
                    self?.coordinates = [coordinate]
                    self?.history.append(coordinate)
                    self?.saveHistory()
                }
            })
            .store(in: &cancellables)
    }
    
    private func saveHistory() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(history) {
            UserDefaults.standard.set(encoded, forKey: "History")
        }
    }
    
    func loadHistory() {
        if let savedData = UserDefaults.standard.data(forKey: "History") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Coordinate].self, from: savedData) {
                history = decoded
            }
        }
    }
}
