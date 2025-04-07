//
//  ViewController.swift
//  BMI Calculator OOP
//
//  Created by Jonathan Cheth on 4/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmiValue: Float = 0.0
    var calculateLogic = CalculateLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let heightFormatted = String(format: "%.2f", sender.value)
        //print(heightFormatted)
        heightLabel.text = heightFormatted + "m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weightFormatted = String(format: "%.0f", sender.value)
        //print(weightFormatted)
        weightLabel.text = weightFormatted + "kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        calculateLogic.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateLogic.getBMIValue()
            destinationVC.advice = calculateLogic.getAdvice()
            destinationVC.color = calculateLogic.getColor()
        }
    }
    
}

