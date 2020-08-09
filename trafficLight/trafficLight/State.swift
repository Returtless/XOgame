//
//  State.swift
//  trafficLight
//
//  Created by Владислав Лихачев on 09.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

public protocol State {
    
    var label : UILabel { get }
    
    var isCompleted: Bool { get }
    
    func begin()
    
}

enum Light: CaseIterable {
    case red
    case orange
    case green
    case clear
    
    var next: Light {
        switch self {
        case .red: return .orange
        case .orange: return .green
        case .green: return .red
        case .clear: return .red
        }
    }
}


class LightState : State {
    var label: UILabel
    
    var isCompleted: Bool = false
    
    var light: Light
    
    func begin() {
        switch light {
        case .red:
            label.backgroundColor = UIColor.red
        case .orange:
            label.backgroundColor = UIColor.orange
        case .green:
            label.backgroundColor = UIColor.green
        case .clear : return
        }
        
    }
    
    init(light: Light, label : UILabel) {
        self.label = label
        self.light = light
    }
    
}
