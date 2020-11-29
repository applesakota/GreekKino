//
//  StartGameViewController.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/29/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit

class StartGameViewController: UIViewController {
    
    @IBOutlet weak var startGameTextView: UITextView!
    @IBOutlet weak var startGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        startGameTextView.text = "Welcome to Greek Kino"
        startGameButton.setTitle("Start Game", for: .normal)
        startGameButton.setTitleColor(UIColor.white, for: .normal)
        startGameButton.backgroundColor = UIColor.lightGray
        startGameButton.layer.borderWidth = 1
        startGameButton.layer.cornerRadius = 5
    }
    
    @IBAction func startGameButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(identifier: "RootViewController")
        self.dismiss(animated: false, completion: nil)
        present(rootViewController, animated: true)
        
    }
}
