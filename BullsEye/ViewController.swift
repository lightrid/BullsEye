//
//  ViewController.swift
//  BullsEye
//
//  Created by Mykhailo Kviatkovskyi on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Float = 0
    var targetValue = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = sender.value
        
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(Int(currentValue))" +
            "\nThe target value is: \(targetValue)"

        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert,
                animated: true,
                completion: nil)
        
        startNewRound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = 50
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
    }
    
}

