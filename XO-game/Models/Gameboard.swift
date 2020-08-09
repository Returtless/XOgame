//
//  Gameboard.swift
//  XO-game
//
//  Created by Evgeny Kireev on 27/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

public final class Gameboard {
    
    // MARK: - Properties
    
    private lazy var positions: [[Player?]] = initialPositions()
    
    private(set) var playerOneMoves: [GameboardPosition] = []
    private(set) var playerTwoMoves: [GameboardPosition] = []
    
    // MARK: - public
    
    public func setPlayer(_ player: Player, at position: GameboardPosition) {
        positions[position.column][position.row] = player
    }
    
    public func clear() {
        self.positions = initialPositions()
        self.playerOneMoves = []
        self.playerTwoMoves = []
    }
    
    public func contains(player: Player, at positions: [GameboardPosition]) -> Bool {
        for position in positions {
            guard contains(player: player, at: position) else {
                return false
            }
        }
        return true
    }
    
    public func contains(player: Player, at position: GameboardPosition) -> Bool {
        let (column, row) = (position.column, position.row)
        return positions[column][row] == player
    }
    
    public func addPositionToMoves(for player : Player, at position: GameboardPosition){
        switch player {
        case .first:
            playerOneMoves.append(position)
        case .second:
            playerTwoMoves.append(position)
            
        }
    }
    public func isFullMoves(for player: Player) -> Bool{
        switch player {
        case .first:
            return playerOneMoves.count == 5
        case .second:
           return playerTwoMoves.count == 5
        }
    }
    // MARK: - Private
    
    private func initialPositions() -> [[Player?]] {
        var positions: [[Player?]] = []
        for _ in 0 ..< GameboardSize.columns {
            let rows = Array<Player?>(repeating: nil, count: GameboardSize.rows)
            positions.append(rows)
        }
        return positions
    }
}
