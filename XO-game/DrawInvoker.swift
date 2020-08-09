//
//  DrawInvoker.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class DrawInvoker {
    // MARK: Singleton
    
    internal static let shared = DrawInvoker()
    // MARK: Private properties
    
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    private let batchSize = 5
    
    private var commandsX: [DrawCommand] = []
    private var commandsO: [DrawCommand] = []
    
    internal func setGameboard(gameboard: Gameboard, gameboardView: GameboardView){
        self.gameboardView = gameboardView
        self.gameboard = gameboard
        
    }
    // MARK: Internal
    
    internal func addDrawCommand(for player: Player, _ command: DrawCommand) {
        switch player {
        case .first:
            self.commandsX.append(command)
        case .second:
            self.commandsO.append(command)
        }
        self.executeCommandsIfNeeded()
    }
    
    // MARK: Private
    
    private func executeCommandsIfNeeded() {
        guard self.commandsX.count >= batchSize && self.commandsO.count >= batchSize else {
            return
        }
        gameboardView?.clear()
        
        for i in 0..<batchSize {
            self.commandsX[i].execute()
            self.commandsO[i].execute()
        }
        self.commandsX = []
        self.commandsO = []
    }
    
    
}
