//
//  ViewController.swift
//  BullsEye
//
//  Created by Mykhailo Kviatkovskyi on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("The value of the slider is now: \(sender.value)")
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, World", message: "This is my first app", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

