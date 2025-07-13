//
//  weatherManager.swift
//  Clima
//
//  Created by Syed Farhan on 08/07/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

import CoreLocation
protocol WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel)
}


struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=61390e9d333fa3e755e10f7d06f133ee&&units=metric"
    
    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String){
        let cityUrl = "\(weatherUrl)&q=\(cityName)"
        performRequest(cityUrl: cityUrl)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let cityUrl = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(cityUrl: cityUrl)
        
    }
    
    func performRequest(cityUrl: String){
     
        if   let url = URL(string: cityUrl){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {( data, response,error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    let dataString = String(data: safeData, encoding: .utf8)
                  if  let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather )
                        
                    }
                    
                    
                }
                
            }
            task.resume()
            
        }
        
    }
    func parseJSON(weatherData: Data) ->WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityname: name, temperature: temp)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
   
}

