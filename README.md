# WeatherApp

WeatherApp is a simple iOS app that fetches and displays weather information for a specified city using data from the OpenWeather API. It includes a map view with location markers and a history log of fetched coordinates and timestamps.

## Features

- **Weather Data Fetching**: Retrieves current weather data from the API with options to specify location.
- **Map View**: Displays a map with a marker for the fetched location coordinates.
- **History Log**: Keeps track of past location data, showing coordinates with timestamps.

## Screenshots


<img src="https://github.com/user-attachments/assets/48b04e8b-91f0-4ad5-8fdc-ee0b90d8bf72" width="300" />

<img src="https://github.com/user-attachments/assets/9ee60939-a621-45af-a328-bbc17ac63569" width="300" />


## Project Structure

- `Models`: Defines data structures for weather data and coordinates.
- `Service`: Handles network requests with configurable constants for API keys and endpoints.
- `View`: Contains SwiftUI views for map and history display.
- `ViewModel.swift`: Manages app data and interactions between the model and view.

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/jatezzz/weather-info
   ```
2. **Open the project in Xcode**
3. **Run the app on a simulator or a physical device.**
