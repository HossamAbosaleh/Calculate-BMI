//
//  CalculatorBrain.swift
//  Calculate BMI
//
//  Created by Abo Saleh on 9/23/20.
//  Copyright © 2020 Abo Saleh. All rights reserved.
//

import UIKit

struct CalculatorBrian {
    var bmi: BMI?
    
    mutating func calulateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(bmivalue: bmiValue, advice:  "اي هما بياكلو اكلك 🙂", color: #colorLiteral(red: 0.1775768101, green: 0.4997099638, blue: 0.7587864995, alpha: 1))
        case 18.5...24.9:
            bmi = BMI(bmivalue: bmiValue, advice:  "انت زي الفل 👍", color: #colorLiteral(red: 0.4678051472, green: 0.766290009, blue: 0.2676058114, alpha: 1))
        case 25...:
            bmi = BMI(bmivalue: bmiValue, advice: "قلل اكل كتر رياضه 🏋️‍♂️", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        default:
            break
        }
    }
    
    func getBMIValue() -> String {
        let bmiBy2DecimalNum = String(format: "%.2f", bmi?.bmivalue ?? 0.0 )
         return bmiBy2DecimalNum
    }
    func getAdvice() -> String {
        let finalAdvice = bmi?.advice ?? "No advice for you"
        return finalAdvice
    }
    func getColor() -> UIColor {
        let finalColor = bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return finalColor
    }
}
