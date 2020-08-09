//
//  Command.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

protocol Command {
    
    func execute()
}

class DrawCommand: Command {
    
    let action: DrawAction
    
    init(action: DrawAction, gameboard: Gameboard, gameboardView: GameboardView) {
        self.action = action
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }

    
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    func execute() {
        switch self.action {
        case .playerODraw(let position) :
            if (!(gameboardView?.canPlaceMarkView(at: position))!){
                gameboardView?.removeMarkView(at: position)
            }
             self.gameboardView?.placeMarkView(OView(), at: position)
            self.gameboard?.setPlayer(.second, at: position)
        case .playerXDraw(let position) :
            if (!(gameboardView?.canPlaceMarkView(at: position))!){
                gameboardView?.removeMarkView(at: position)
            }
             self.gameboardView?.placeMarkView(XView(), at: position)
            self.gameboard?.setPlayer(.first, at: position)
            
        }

    }
}

public enum DrawAction {
    
    case playerXDraw(position: GameboardPosition)
    
    case playerODraw(position: GameboardPosition)
    
}
