//
//  GameViewController.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/21/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit


class GameViewController: UIViewController {
    
    
    var gameToPlay: GameModel?
    var sellectedNumbers: [Int] = []
    var countNumbers = 8 {
        didSet {
            trackNumbersLabel.text = "Brojeva: \(countNumbers)"
        }
    }
    
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var trackNumbersLabel: UILabel!
    
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
        trackNumbersLabel.text = "Brojeva: \(countNumbers)"
    }
    
    //MARK: - Actions
    @IBAction func selectRandomNumbersButton(_ sender: Any) {
        let upperBound: Int = 8
        let selectRandomNumbers = makeRandomNumbersSellection(upperBound)
        sellectedNumbers = []
        sellectedNumbers = selectRandomNumbers
        countNumbers = 0
        collectionView.reloadData()
    }
    func makeRandomNumbersSellection(_ upperBound: Int) -> [Int] {
        return (1...upperBound).map{_ in Int.random(in: 1...80)}
    }
    
    func alert() {
        if countNumbers == 0 {
            let alertController = UIAlertController(title: "You selected 8 numbers of 80", message: "Is that your final choice?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.pressed()
            }
            let resetAction = UIAlertAction(title: "Reset", style: .default) { (action) in
                self.resetPressed()
            }
            alertController.addAction(alertAction)
            alertController.addAction(resetAction)
            present(alertController, animated: true)
        }
    }
    func pressed() {
        collectionView.allowsSelection = false
    }
    func resetPressed() {
        countNumbers = 8
        sellectedNumbers = []
        self.collectionView.reloadData()
    }

    
}
extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewItemCell", for: indexPath) as? CollectionViewItem else { fatalError("cannot load item")}
        item.collectionViewItemCellLabel.text = String(indexPath.row + 1)
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
            countNumbers = countNumbers - 1
            alert()
            collectionView.reloadData()
        }

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if sellectedNumbers.contains(indexPath.item) {
            sellectedNumbers = sellectedNumbers.filter {$0 != indexPath.item }
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80
    }

    
}
