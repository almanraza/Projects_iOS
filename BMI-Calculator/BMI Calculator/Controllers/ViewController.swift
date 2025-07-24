//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var CalculatorBrain = calculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heighttSlider: UISlider!
    @IBOutlet weak var WeightLabel: UILabel!
    @IBAction func heightChanged(_ sender: UISlider) {
        let x = (String(format: "%.2f", sender.value))
        heightLabel.text = "\(x)m"
    }
    @IBAction func weightChanged(_ sender: UISlider) {
        let y = (String(format: "%.0f", sender.value))
        WeightLabel.text = "\(y)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heighttSlider.value
        
        CalculatorBrain.calculateBMI(height: height, weight: weight)
        
  
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVc = segue.destination as! resultViewController
            destinationVc.bmiValue = CalculatorBrain.bmi()
            destinationVc.advice = CalculatorBrain.getAdvice()
            destinationVc.color = CalculatorBrain.getColor()
        }
    }
}

