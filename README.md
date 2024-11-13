# WeatherApp

WeatherApp is a simple iOS app that fetches and displays weather information for a specified city using data from the OpenWeather API. It includes a map view with location markers and a history log of fetched coordinates and timestamps.

## Features

- **Weather Data Fetching**: Retrieves current weather data from the API for a specified city.
- **Map View**: Displays a map with a marker at the fetched coordinates.
- **Query History**: Keeps a log of past coordinate queries, displaying the date and time of each entry.

## Project Structure

The project follows an MVVM (Model-View-ViewModel) architecture to enhance code maintainability and separation of responsibilities.

- **Models (`Models`)**: Defines data structures for weather data and coordinates.
- **Service (`Service`)**: Manages network requests with configurable constants for the API key and endpoints.
   - Includes dependency injection to facilitate unit testing of the ViewModel.
- **View (`View`)**: Contains SwiftUI views, including the map and history views.
   - Uses an `enum` (`ActiveView`) to manage navigation between views more clearly and prevent inconsistent states.
- **ViewModel (`ViewModel.swift`)**: Manages app data and interactions between the model and the view.
   - Implements dependency injection, allowing for a mock network service (`MockNetworkService`) in unit tests to control response data.

## Screenshots


<img src="https://github.com/user-attachments/assets/48b04e8b-91f0-4ad5-8fdc-ee0b90d8bf72" width="300" />

<img src="https://github.com/user-attachments/assets/9ee60939-a621-45af-a328-bbc17ac63569" width="300" />


## Project Structure

- `Models`: Defines data structures for weather data and coordinates.
- `Service`: Handles network requests with configurable constants for API keys and endpoints.
- `View`: Contains SwiftUI views for map and history display.
- `ViewModel.swift`: Manages app data and interactions between the model and view.

## Technical Decisions

- **MVVM Architecture**: We use the MVVM pattern to decouple business logic from the user interface, improving scalability and testability.
- **Dependency Injection**: The `ViewModel` uses dependency injection, enabling the use of a mock `NetworkService` (`MockNetworkService`) in unit tests to control response data.
- **View Management with `enum`**: An `enum` is used to represent active views in the application, avoiding navigation conflicts and enhancing extensibility.

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/jatezzz/weather-info
   ```
2. **Open the project in Xcode**
3. **Run the app on a simulator or a physical device.**
