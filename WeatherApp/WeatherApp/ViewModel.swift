//
//  ViewMode.swift
//  WeatherApp
//
//  Created by Max Pugh on 11/30/23.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temperature: String = "-"
    @Published var timeZone: String = "-"
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=33.78&lon=-117.85&units=imperial&exclude=hourly,daily&appid=067eb00beba0e0f544c2bc68efc6f100") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, error in guard let data = data, error == nil else {
                return
            }
            //            convert data into model
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async{
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.description = model.current.weather.first?.description ?? "No Description"
                    self.temperature = "\(model.current.temp)°"
                    self.timeZone = model.timezone
                }
            }
            catch{
                print("Failed")
            }
            
        }
        task.resume()
    }
}
