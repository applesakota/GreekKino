//
//  ViewController.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/19/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameTimer: Timer?
    
    @IBOutlet weak var gameTableView: UITableView!
    
    
    var gameModel: [GameModel] = []{
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.gameTableView.reloadData()
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.shared.getAllGames(responseError: { (error) in
            
        }) {(model) in
            if let model = model as? [GameModel] {
                self.gameModel = model
            }
        }
        configureTableView()
    }
//MARK: - UI
    func configureTableView() {
        gameTableView.delegate = self
        gameTableView.dataSource = self
    }
//MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameScreen" {
            if let gameViewController = segue.destination as? GameViewController {
                if let cell = sender as? UITableViewCell,
                    let indexPath = gameTableView.indexPath(for: cell) {
                    let item = gameModel[indexPath.row]
                    gameViewController.gameToPlay = item
                }
            }
        }
    }
}
//MARK: -TableView DataSource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as? GameCell else { fatalError("Faild load Cell") }
        cell.configureUI(item: gameModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

