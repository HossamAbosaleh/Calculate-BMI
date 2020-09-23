//
//  ViewController.swift
//  Calculate BMI
//
//  Created by Abo Saleh on 9/23/20.
//  Copyright © 2020 Abo Saleh. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var caluculatorBrian = CalculatorBrian()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        let valueOfHeightSlider = sender.value
        let height = String(format: "%.2f", valueOfHeightSlider)
        heightLable.text = "\(height) m"
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        let valueOfWeightSlider = sender.value
        let weight = String(format: "%.0f", valueOfWeightSlider)
        weightLable.text = "\(weight) Kg"
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        caluculatorBrian.calulateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    //MARK: - passBySegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destniationVC = segue.destination as! ResultViewController
            destniationVC.bmiValue = caluculatorBrian.getBMIValue()
            destniationVC.advice = caluculatorBrian.getAdvice()
            destniationVC.color = caluculatorBrian.getColor()
        }
    }
}

