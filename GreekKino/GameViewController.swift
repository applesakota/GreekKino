//
//  GameViewController.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/21/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit


class GameViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameToPlay: GameModel?
    
    var sellectedNumbers: [Int] = []
    
    @IBOutlet weak var navItem: UINavigationItem!


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setNavigationUI()
        
    }
    
    func setNavigationUI() {
        if let gamePlay = gameToPlay {
            navItem.title = "Vreme izvlacenja \(Date(timeIntervalSince1970: TimeInterval(gamePlay.drawTime)).convertToTimeString()) | Kolo \(gamePlay.drawID)"
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewItemCell", for: indexPath) as? CollectionViewItem else { fatalError("cannot load item")}
        item.collectionViewItemCellLabel.text = String(indexPath.row)
        if sellectedNumbers.contains(indexPath.item) {
            item.backgroundColor = UIColor.blue
        } else {
            item.backgroundColor = UIColor.lightGray
        }
        return item
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !sellectedNumbers.contains(indexPath.item) {
            sellectedNumbers.append(indexPath.item)
            collectionView.reloadData()
        }

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if sellectedNumbers.contains(indexPath.item) {
            sellectedNumbers = sellectedNumbers.filter {$0 != indexPath.item }
            collectionView.reloadData()
        }
    }
    
}
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80
    }

    
}
