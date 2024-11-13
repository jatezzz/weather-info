# WeatherApp

WeatherApp is a simple iOS app that fetches and displays weather information for a specified city using data from the OpenWeather API. It includes a map view with location markers and a history log of fetched coordinates and timestamps.

## Features

- **Weather Data Fetching**: Retrieves current weather data from the API with options to specify location.
- **Map View**: Displays a map with a marker for the fetched location coordinates.
- **History Log**: Keeps track of past location data, showing coordinates with timestamps.

## Project Structure

- `Models`: Defines data structures for weather data and coordinates.
- `Service`: Handles network requests with configurable constants for API keys and endpoints.
- `View`: Contains SwiftUI views for map and history display.
- `ViewModel.swift`: Manages app data and interactions between the model and view.

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   ```
2. **Open the project in Xcode**
3. **Run the app on a simulator or a physical device.**