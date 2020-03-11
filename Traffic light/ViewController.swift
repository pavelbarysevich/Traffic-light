//
//  ViewController.swift
//  Traffic light
//
//  Created by Павел Борисевич on 3/11/20.
//  Copyright © 2020 Павел Борисевич. All rights reserved.
//

import UIKit

// перечисление
enum CurrentLight {
case Red, Yellow, Green
}

class ViewController: UIViewController {
    
    @IBOutlet var redTraffic: UIView!
    @IBOutlet var yellowTraffic: UIView!
    @IBOutlet var greenTraffic: UIView!
        
    @IBOutlet var startButton: UIButton!
    
    // приватные свойства
    private var currentLight = CurrentLight.Red
    
    // заранее заданные параметры / 1 - активный свет светофора / 0.3 тусклый
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // скругление углов кнопки "START"
        startButton.layer.cornerRadius = 15
        
        // затемнение светофора
        redTraffic.alpha = lightIsOff
        yellowTraffic.alpha = lightIsOff
        greenTraffic.alpha = lightIsOff
        
        // скругление углов до круга view, если жестко заданы параметры
        redTraffic.layer.cornerRadius = redTraffic.frame.width / 2
        yellowTraffic.layer.cornerRadius = yellowTraffic.frame.width / 2
        greenTraffic.layer.cornerRadius = greenTraffic.frame.width / 2
    }
    
   
    
    @IBAction func startButtonNext(_ sender: Any) {
        
        // изменение название кнопки на "NEXT"
        startButton.setTitle("NEXT", for: .normal)
        
        // цыкл switch - последовательность переключение светофора
        switch currentLight {
        case .Red:
            greenTraffic.alpha = lightIsOff
            redTraffic.alpha = lightIsOn
            currentLight = .Yellow
        case .Yellow:
            redTraffic.alpha = lightIsOff
            yellowTraffic.alpha = lightIsOn
            currentLight = .Green
        case .Green:
            greenTraffic.alpha = lightIsOn
            yellowTraffic.alpha = lightIsOff
            currentLight = .Red
        }
    }
    
}

