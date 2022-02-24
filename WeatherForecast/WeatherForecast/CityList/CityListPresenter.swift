//
//  CityListPresenter.swift
//  WeatherForecast
//
//  Created by MacOS on 24.02.2022.
//

import Foundation
import UIKit

protocol CityListPresentationLogic: AnyObject {
    func presentCityList(response: CityList.Fetch.Response)
    
}

final class CityListPresenter: CityListPresentationLogic {
    
    func presentCityList(response: CityList.Fetch.Response) {
        var cityList: [CityList.Fetch.ViewModel.City] = []
        
        response.cityList.forEach {
            cityList.append(CityList.Fetch.ViewModel.City(distance: $0.distance, title: $0.title, location_type: $0.location_type, woeid: $0.woeid, latt_long: $0.latt_long))
        }
    }
}
