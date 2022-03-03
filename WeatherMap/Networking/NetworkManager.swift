//
//  NetworkManager.swift
//  WeatherMap
//
//  Created by Yushkevich Ilya on 20.02.22.
//

import Foundation
import MapKit
import Alamofire

final class NetworkManager {
    private static let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    private static let key = "39e8ed5d7ca75923a4897a4a2a755522"
    
    private enum Options {
        static let lat = "lat="
        static let lon = "&lon="
        static let appid = "&appid="
    }
    
    static func getWeather(coordinates: CLLocationCoordinate2D, completion: @escaping (Weather) -> (Void)) {
        AF.request(baseURL + Options.lat + String(Int(coordinates.latitude)) + Options.lon + String(Int(coordinates.longitude)) + Options.appid + key).responseDecodable(of: Weather.self) {response in
            switch response.result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
