//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import UIKit

public class PlayerInputState: GameState {
    
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
        guard let gameboardView = self.gameboardView, let position = position
            , gameboardView.canPlaceMarkView(at: position)
            else { return }
        
        Log(.playerInput(player: self.player, position: position))
        
        if player == .first {
        let command = DrawCommand(action: .playerXDraw(position: position), gameboard: self.gameboard!, gameboardView: self.gameboardView!)
            DrawInvoker.shared.addDrawCommand(for: player, command)
        } else {
            let command = DrawCommand(action: .playerODraw(position: position), gameboard: self.gameboard!, gameboardView: self.gameboardView!)
            DrawInvoker.shared.addDrawCommand(for: player, command)
        }
        
        self.gameboard?.setPlayer(self.player, at: position)
        //self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }
}
