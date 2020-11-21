//
//  NetworkManager.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/19/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    let url = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    func getAllGames(responseError: @escaping (String?) -> Void, successHandler: @escaping (Any?) -> Void) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    //NetworkError
                    return
                }
                switch httpResponse.statusCode {
                case 200...299:
                    guard let jsonData = data else {
                        //invalidData
                        return
                    }
                    do {
                        guard let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String:Any]],
                            let gamesData = try? JSONSerialization.data(withJSONObject: jsonDict, options: .init()) else {
                                return
                        }
                        let allGamess = try JSONDecoder().decode([GameModel].self, from: gamesData)
                        successHandler(allGamess)
                    } catch {
                        
                    }
                    
                default:
                    return
                }
                
            }.resume()
        }
    }
    
    
}
