//
//  StartGameViewController.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func startPlayersGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func startAiGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.isAiGame = true
        present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func startFiveMovesGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
               gameVC.isFiveMoves = true
               present(gameVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
