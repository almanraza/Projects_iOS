//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var bill: Float = 0.00
    var tip = 0.10
    var splitNumber = 1
    var splitAmount: Double = 0.00
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
           
        } else if sender == tenPctButton {
            tenPctButton.isSelected = true
         
        } else if sender == twentyPctButton {
            
            twentyPctButton.isSelected = true
        }
        let buttonTitle = sender.currentTitle
        let buttonTitleMinusPercentSign =  String(buttonTitle?.dropLast() ?? "")
        let number = Double(buttonTitleMinusPercentSign)
        tip = number! / 100
    }
        
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitLabel.text = String(format:"%.0f", (sender.value))
        
        splitNumber = Int(sender.value)
        
       
    }
    func billAmount() -> Float {
        bill =  Float(billTextField.text!) ?? 0.00
        return bill
    }
    func calculateSpiltAmount() -> Double {
        let totalAmountWithTip: Double = (Double(bill) * (tip)) + Double(bill)
        let splitAmount: Double = totalAmountWithTip / Double(splitNumber)
        return splitAmount
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = billAmount()
        splitAmount =  calculateSpiltAmount()
        print(tip)
        print(splitNumber)
        print(bill)
        print(splitAmount)
        
        performSegue(withIdentifier: "goToResult", sender: self)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "goToResult" {
             let destinationVC = segue.destination as! ResultViewController
             
             destinationVC.result = String(format: "%.2f", splitAmount)
             destinationVC.tip = Int(tip * 100)
             destinationVC.split = splitNumber
         }
     }
    
    
}



