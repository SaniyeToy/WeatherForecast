//
//  CityDetailsPresenter.swift
//  WeatherForecast
//
//  Created by MacOS on 24.02.2022.
//

import Foundation
import UIKit

protocol CityDetailsPresentationLogic {

    func presentCityWeather(response: Weather.Fetch.Response)
}

class CityDetailsPresenter: CityDetailsPresentationLogic {
    weak var viewController: CityDetailsDisplayLogic?
    

    
    func presentCityWeather(response: Weather.Fetch.Response){
        
        var weatherDetails: [Weather.Fetch.ViewModel.WeatherDetails] = []
        
        response.weatherDetails.forEach {
            weatherDetails.append(Weather.Fetch.ViewModel.WeatherDetails(weather_state_name:  $0.weather_state_name,
                                                                         applicable_date:  $0.applicable_date,
                                                                         min_temp:  $0.min_temp,
                                                                         max_temp:  $0.max_temp,
                                                                         the_temp:  $0.the_temp,
                                                                         wind_speed:  $0.wind_speed,
                                                                         wind_direction:  $0.wind_direction,
                                                                         air_pressure:  $0.air_pressure,
                                                                         humidity:  $0.humidity))
            
        }
        viewController?.presentCityWeather(viewModel: Weather.Fetch.ViewModel(weatherDetails: weatherDetails))
    }
}
