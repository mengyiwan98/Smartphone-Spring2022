//
//  ViewController.swift
//  BMICalculator
//
//  Created by wanmengyi on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtInches: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


   
    @IBAction func calculateBMIAction(_ sender: Any) {
    
        guard let weight = Float(txtWeight.text!) else {return}
        guard let feet = Float(txtFeet.text!) else {return}
        guard let inches = Float(txtInches.text!) else {return}

        let HeightInches = inches + feet * 12
        let HeightSquare = HeightInches * HeightInches
        let BMI = weight / HeightSquare * 703

        lblBMI.text = "BMI: \(BMI)"
               
        if(BMI < 18.5) {
            lblResult.text = "You are underweight"
        }
        else if(BMI >= 18.5 && BMI <= 24.9) {
            lblResult.text = "You are healthy weight"
        }
        else if(BMI >= 25 && BMI <= 29.9) {
            lblResult.text = "You are overweight"
        }
        else {
            lblResult.text = "You are obese"
        }
    }
    
}

