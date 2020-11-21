//
//  GameCell.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/19/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit

class GameCell: UITableViewCell {
    var gameTimer: Timer?
    
    var counter = Date().currentTimeMillis()
    
    @IBOutlet var gameTimeLabel: UILabel!
    @IBOutlet var remainingTime: UILabel!
    
    func configureUI(item: GameModel) {
        createTimer()
        gameTimeLabel.text = Date(timeIntervalSince1970: TimeInterval(item.drawTime)).convertToTimeString()
        remainingTime.text = Date(timeIntervalSince1970: TimeInterval(counter - item.drawTime)).convertToTimeString()
    }
    func createTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    @objc func update() {
        
        
    }
}
