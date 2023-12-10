//
//  model.swift
//  WeatherApp
//
//  Created by Max Pugh on 11/30/23.
//

import Foundation
struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}
struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}
struct WeatherInfo: Codable {
    let main: String
    let description: String
}
