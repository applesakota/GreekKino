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
    
    var selectedIndex = [IndexPath]()
    var sellectedGames = [String]()
    
    @IBOutlet weak var navItem: UINavigationItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
        configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setNavigationUI() {
        if let gamePlay = gameToPlay {
            navItem.title = "Vreme izvlacenja \(Date(timeIntervalSince1970: TimeInterval(gamePlay.drawTime)).convertToTimeString()) | Kolo \(gamePlay.drawID)"
        }
    }
    func configureUI() {
        collectionView.allowsMultipleSelection = false
        collectionView.isUserInteractionEnabled = true
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewItemCell", for: indexPath) as? CollectionViewItem else { fatalError("cannot load item")}
        item.collectionViewItemCellLabel.text = String(indexPath.item + 1)
        if item.isSelected == true {
            item.backgroundColor = UIColor.red
        } else {
            item.backgroundColor = UIColor.lightGray
        }
        return item
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    
}
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80
    }

    
}
