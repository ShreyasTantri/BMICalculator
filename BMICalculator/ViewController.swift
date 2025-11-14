//
//  ViewController.swift
//  BMICalculator
//
//  Created by CCS038 on 14/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         BMI = W/(h*h)
         */
        
        let label1 = UILabel()
        let label2 = UILabel()
        
        label1.text = "Enter your weight"
        label2.text = "Enter your height"
        
        view.addSubview(label1)
        view.addSubview(label2)
    }


}

