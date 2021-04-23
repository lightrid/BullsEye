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
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = sender.value
    }
    
    @IBAction func showAlert() {
        let difference = abs(Int(currentValue) - targetValue)
        var points = 100 - difference
        let title: String
       
        var message = "You scored \(points) points"
        
        switch difference {
        case 0...2:
            let bonusScore = difference == 0 ? 100 : 50
            title = "Perfect!"
            message += "\nand \(bonusScore) bonus point"
            points += bonusScore
        case 0...5:
            title = "You almost had it!"
        case 0...10:
            title = "Pretty good"
        default:
            title = "Not even close..."
        }
        
        score += points
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {_ in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert,
                animated: true,
                completion: nil)
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
                         trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
                         trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        currentValue = 50
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

