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
    
    var gameTimer: Timer!
    
    var counter = Date().currentTimeMillis()
    
    @IBOutlet var gameTimeLabel: UILabel!
    @IBOutlet var remainingTime: UILabel!
    
    
//MARK: -UI
    func configureUI(item: GameModel) {
        gameTimeLabel.text = Date(timeIntervalSince1970: TimeInterval(item.drawTime)).convertToTimeString()
        remainingTime.text = Date(timeIntervalSince1970: TimeInterval(counter - item.drawTime)).convertToTimeWithSecondsString()
        createTimer()
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
//MARK: - SetTimer
    func createTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    @objc func update() {
        if counter > 0 {
            remainingTime.text = Date(timeIntervalSince1970: TimeInterval(counter)).convertToTimeWithSecondsString()
            counter = counter - 1
        } else if counter == 0 {
            gameTimer.invalidate()
        }
    }
}
