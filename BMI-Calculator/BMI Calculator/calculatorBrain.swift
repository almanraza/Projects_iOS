    //
    //  calculatorBrain.swift
    //  BMI Calculator
    //
    //  Created by Syed Farhan on 23/06/2025.
    //  Copyright © 2025 Angela Yu. All rights reserved.
    //

    import Foundation
    import UIKit
struct calculatorBrain{
    var  bmiValue: bmiSecond?
        
        func bmi() -> String {
            
            let bmioneDec = String(format: "%.1f", bmiValue?.value ?? 0.0)
            return bmioneDec
        }
            
        func getAdvice() -> String {
                return bmiValue?.advice ?? ""
            }
        func getColor() -> UIColor {
                return bmiValue?.color ?? UIColor.red
            }
            
            
        
        func calculateBMI(height: Float , weight: Float)  {
            let bmiValue =  (weight / (height * height))
            var Bmi = bmiSecond(value: bmiValue, color: UIColor.red, advice: "String")
            if bmiValue < 18.5 {
                Bmi = bmiSecond(value: bmiValue, color: UIColor.red, advice: "Underweight")
                print(Bmi.advice)
            } else if bmiValue<24.9 && bmiValue>18.5{
                Bmi = bmiSecond(value: bmiValue, color: UIColor.systemBlue, advice: "Normal weight")
                print(Bmi.advice)
            } else {
                Bmi = bmiSecond(value: bmiValue, color: UIColor.systemRed, advice: "Overweight")
                print(Bmi.advice)
            }
            
        }
}





