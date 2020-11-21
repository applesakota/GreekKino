//
//  GameModel.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/19/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation


struct GameModel: Codable {
    
    let gameID: Int
    let drawID: Int
    let drawTime: Int
    let status: Status
    let drawBreak, visualDraw: Int
    let pricePoints: PricePoints
    let prizeCategories: [PrizeCategory]?
    let wagerStatistics: WagerStatistics

    enum CodingKeys: String, CodingKey {
        case gameID = "gameId"
        case drawID = "drawId"
        case drawTime, status, drawBreak, visualDraw, pricePoints, prizeCategories, wagerStatistics
    }
}
// MARK: - PricePoints
struct PricePoints: Codable {
    let addOn: [AddOn]
    let amount: Double
}
// MARK: - AddOn
struct AddOn: Codable {
    let amount: Double
    let gameType: AddOnGameType
}
enum AddOnGameType: String, Codable {
    case kinoBonus = "KinoBonus"
    case sideBets = "SideBets"
}
// MARK: - PrizeCategory
struct PrizeCategory: Codable {
    let id, divident, winners, distributed: Int
    let jackpot: Int
    let fixed: Double
    let categoryType: Int
    let gameType: PrizeCategoryGameType
}
// MARK: - WagerStatistics
struct WagerStatistics: Codable {
    let columns, wagers: Int
    let addOn: [AddOn]
}
enum PrizeCategoryGameType: String, Codable {
    case column = "Column"
    case draw = "Draw"
    case kino = "Kino"
    case kinoBonus = "KinoBonus"
    case oddEven = "OddEven"
}
enum Status: String, Codable {
    case active = "active"
    case future = "future"
}
