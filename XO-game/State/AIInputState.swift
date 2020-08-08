//
//  AIInputState.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class AIInputState : GameState {
    public private(set) var isCompleted = false
    
    public let player: Player
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    public let markViewPrototype: MarkView
    
    init(player: Player, markViewPrototype: MarkView, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.markViewPrototype = markViewPrototype
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    public func begin() {
        switch self.player {
        case .first:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
            self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    public func addMark(at position: GameboardPosition?) {
        var aiPosition : GameboardPosition?
        guard let gameboardView = self.gameboardView
            else { return }
        repeat {
            aiPosition = GameboardPosition(column: Int.random(in: 0...2), row: Int.random(in: 0...2))
        } while !gameboardView.canPlaceMarkView(at: aiPosition!)
        
        Log(.playerInput(player: self.player, position: aiPosition!))
        self.gameboard?.setPlayer(self.player, at: aiPosition!)
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: aiPosition!)
        self.isCompleted = true
    }
}
