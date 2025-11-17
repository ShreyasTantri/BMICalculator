//
//  ViewController.swift
//  BMICalculator
//
//  Created by CCS038 on 14/11/25.
//

import UIKit

class ViewController: UIViewController {
    let weightL = UILabel()
    let heightL = UILabel()
    let weightTF = UITextField()
    let heightTF = UITextField()
    let myButton = UIButton(type: .system)
    let result = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        weightL.text = "Weight (kg)"
        weightL.font = .systemFont(ofSize: 18)
        heightL.text = "Height (cm)"
        heightL.font = .systemFont(ofSize: 18)
        
        weightTF.placeholder = "Enter weight"
        weightTF.textColor = .darkText
        weightTF.borderStyle = .roundedRect
        weightTF.keyboardType = .decimalPad
        
        heightTF.placeholder = "Enter height"
        heightTF.textColor = .darkText
        heightTF.borderStyle = .roundedRect
        heightTF.keyboardType = .decimalPad
        
        result.text = "Your BMI will be displayed here."
        result.font = .systemFont(ofSize: 20, weight: .bold)
        result.textColor = .blue
        result.textAlignment = .center
        
        myButton.setTitle("Calculate BMI", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .systemBlue
        myButton.layer.cornerRadius = 10
        myButton.layer.borderWidth = 2
        myButton.layer.borderColor = UIColor.white.cgColor
        
        weightL.translatesAutoresizingMaskIntoConstraints = false
        heightL.translatesAutoresizingMaskIntoConstraints = false
        weightTF.translatesAutoresizingMaskIntoConstraints = false
        heightTF.translatesAutoresizingMaskIntoConstraints = false
        myButton.translatesAutoresizingMaskIntoConstraints = false
        result.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(weightL)
        view.addSubview(heightL)
        view.addSubview(weightTF)
        view.addSubview(heightTF)
        view.addSubview(myButton)
        view.addSubview(result)

        NSLayoutConstraint.activate([
            weightL.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            weightL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            weightTF.topAnchor.constraint(equalTo: weightL.topAnchor, constant: 40),
            weightTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            heightL.topAnchor.constraint(equalTo: weightTF.topAnchor, constant: 60),
            heightL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heightTF.topAnchor.constraint(equalTo: heightL.topAnchor, constant: 40),
            heightTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            myButton.topAnchor.constraint(equalTo: heightTF.topAnchor, constant: 200),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 150),
            myButton.heightAnchor.constraint(equalToConstant: 40),
            
            result.topAnchor.constraint(equalTo: myButton.topAnchor, constant: 250),
            result.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        )
        
        myButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        guard let weight = weightTF.text else {
            print("Invalid input")
            return
        }
        guard let height = heightTF.text else {
            print("Invalid input")
            return
        }
        guard let weightValue = Double(weight) else {
            print("Invalid input")
            return
        }
        guard let heightValue = Double(height) else {
            print("Invalid input")
            return
        }
        
        let finalHeight = heightValue/100
        
        let BMI = weightValue/(finalHeight*finalHeight)
        let formattedBMI = String(format: "%.1f", BMI)
        
        print("BMI: \(formattedBMI)")        
        result.text = "Your BMI: \(formattedBMI)"
    }

}

