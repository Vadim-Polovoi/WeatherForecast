//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by Вадим on 19.02.22.
//

import Foundation


final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.error(err: error.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      completionHandler(.failure(.invalidResponse))
                      return
                  }
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(json))
            } catch let err {
                completionHandler(.failure(.decodingError(err: err.localizedDescription)))
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}

