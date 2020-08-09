//
//  ViewController.swift
//  trafficLight
//
//  Created by Владислав Лихачев on 09.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var orangeLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    var inProcess = false
    override func viewDidLoad() {
        super.viewDidLoad()
        redLabel.layer.borderColor = UIColor.darkGray.cgColor
        redLabel.layer.borderWidth = 3.0
        orangeLabel.layer.borderColor = UIColor.darkGray.cgColor
        orangeLabel.layer.borderWidth = 3.0
        greenLabel.layer.borderColor = UIColor.darkGray.cgColor
        greenLabel.layer.borderWidth = 3.0
        self.currentState = LightState(light: .red, label: redLabel)
        inProcess = true
        goToCurrentState()
    }
    
    private var currentState: LightState! {
        didSet {
            self.currentState.begin()
        }
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        self.currentState = LightState(light: .red, label: redLabel)
        inProcess = true
        goToCurrentState()
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        self.redLabel.backgroundColor = .clear
        self.greenLabel.backgroundColor = .clear
        self.currentState = LightState(light: .clear, label: self.orangeLabel)
        self.orangeLabel.backgroundColor = .clear
        self.inProcess = false
    }
    
    private func goToCurrentState(){
        let nextLight = self.currentState.light.next
        switch currentState.light {
        case .red:
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if(self.inProcess) {
                    self.redLabel.backgroundColor = .clear
                    self.greenLabel.backgroundColor = .clear
                    self.currentState = LightState(light: nextLight, label: self.orangeLabel)
                    self.goToCurrentState()
                }
            }
            
        case .orange:
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if(self.inProcess) {
                    self.redLabel.backgroundColor = .clear
                    self.orangeLabel.backgroundColor = .clear
                    self.currentState = LightState(light: nextLight, label: self.greenLabel)
                    self.goToCurrentState()
                }
            }
            
        case .green:
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                if(self.inProcess) {
                    self.greenLabel.backgroundColor = .clear
                    self.orangeLabel.backgroundColor = .clear
                    self.currentState = LightState(light: nextLight, label: self.redLabel)
                    self.goToCurrentState()
                }
            }
        case .clear:
            self.inProcess = false
            return
        }
        
        
    }

}

