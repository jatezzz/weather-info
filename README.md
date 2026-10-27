# weather-info

A small SwiftUI app that fetches the current weather for a city, puts a marker on a map at the returned coordinates, and keeps a timestamped history of the queries.

## Context

Built on 13 November 2024 in a single short session: the first and last commits are 44 minutes apart, and the final commit is named "technical discussion".

## What it shows

- MVVM. The ViewModel gets its network service through dependency injection.
- Unit tests for the ViewModel against a `MockNetworkService`.
- A Combine-based network layer and MapKit for the map view.
- An `enum` that drives which view is active, which avoids inconsistent navigation states.
- A README that records the technical decisions, written as part of the exercise.

## Stack

Swift, SwiftUI, Combine, MapKit, CoreLocation, XCTest. Deployment target iOS 18.1.

## Run it

Open `WeatherApp.xcodeproj` in Xcode 16, add your own API key in `Constants.swift`, and run on a simulator.

## Looking back (2026)

The API key and the city are hard-coded in source. Today I would load the key from build configuration that is never committed, take the city from user input, and use async/await in place of Combine for one-shot requests.
