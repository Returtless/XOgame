//
//  GameState.swift
//  XO-game
//
//  Created by Владислав Лихачев on 08.08.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

public protocol GameState {
    
    var isCompleted: Bool { get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
}
