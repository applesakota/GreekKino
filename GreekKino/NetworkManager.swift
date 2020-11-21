//
//  NetworkManager.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/19/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation

enum NetworksErrors: Error {
    case networkError
    case badURL
    case server
    case invalidData
    case unknown
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let url = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    func getAllGames(responseError: @escaping ResponseError, successHandler: @escaping SuccessHandler) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return responseError(NetworksErrors.networkError)
                }
                switch httpResponse.statusCode {
                case 200...299:
                    guard let jsonData = data else {
                        return responseError(NetworksErrors.invalidData)
                    }
                    do {
                        guard let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String:Any]],
                            let gamesData = try? JSONSerialization.data(withJSONObject: jsonDict, options: .init()) else {
                                return responseError(NetworksErrors.invalidData)
                        }
                        let allGamess = try JSONDecoder().decode([GameModel].self, from: gamesData)
                        successHandler(allGamess)
                    } catch {
                        responseError(NetworksErrors.invalidData)
                    }
                    case 400...499:
                        responseError(NetworksErrors.badURL)
                    case 500...599:
                        responseError(NetworksErrors.server)
                    default:
                        responseError(NetworksErrors.unknown)
                }
            }.resume()
        }
    }
}
