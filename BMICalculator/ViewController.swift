//
//  ViewController.swift
//  BMICalculator
//
//  Created by CCS038 on 14/11/25.
//

import UIKit

class ViewController: UIViewController {
    /*
     You used this before:
     var weight: Float
     var height: Float
     
     “You declared stored properties… but you never gave them initial values.”
     Unlike C/Java, Swift does NOT allow uninitialized stored variables in a class.
     So even before your buttonTapped runs, the compiler stops you.
     */
    
    let weightL = UILabel()
    let heightL = UILabel()
    let weightTF = UITextField()
    let heightTF = UITextField()
    let myButton = UIButton(type: .system)
    let result = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         BMI = W/(h*h)
         */
        weightL.text = "Enter your weight"
        weightL.font = .systemFont(ofSize: 18)
        heightL.text = "Enter your height"
        heightL.font = .systemFont(ofSize: 18)
        
        weightTF.placeholder = "Weight"
        weightTF.textColor = .darkText
        weightTF.borderStyle = .roundedRect
        weightTF.keyboardType = .decimalPad
        
        heightTF.placeholder = "Height"
        heightTF.textColor = .darkText
        heightTF.borderStyle = .roundedRect
        heightTF.keyboardType = .decimalPad
        
        result.text = "Your BMI will be displayed here."
        result.font = .systemFont(ofSize: 20, weight: .bold)
        result.textColor = .blue
        result.textAlignment = .center
        
        /*
         Example:
         
         myButton.setTitle("Tap Me", for: .normal)
         myButton.setTitleColor(.white, for: .normal) // Set title color
         
         myButton.backgroundColor = .blue
         
         myButton.layer.cornerRadius = 10 // Rounded corners
         myButton.layer.borderWidth = 2 // Border thickness
         myButton.layer.borderColor = UIColor.white.cgColor // Border color
         
         myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
         
         Equivalent to IBActions:
         
         @objc buttonTapped(_ sender: UIButton) {
             print("Button was tapped!")
             // Handle the event here
         }

         myButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
         */
        
        myButton.setTitle("Calculate", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .blue
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
            
            weightTF.topAnchor.constraint(equalTo: weightL.topAnchor, constant: 50),
            weightTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            heightL.topAnchor.constraint(equalTo: weightTF.topAnchor, constant: 100),
            heightL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heightTF.topAnchor.constraint(equalTo: heightL.topAnchor, constant: 50),
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
        
        
        /*
         Adding constraints programmatically in Swift UIKit is achieved primarily using NSLayoutConstraint and NSLayoutAnchor.
         
         Before adding constraints, ensure the view's translatesAutoresizingMaskIntoConstraints property is set to false. This disables the automatic translation of autoresizing masks into constraints, preventing conflicts with your programmatic constraints.
         */
        
        myButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        // convert weight and height which are in String to double here
//        let w = Double(weightTF.text!)!
//        let h = Double(heightTF.text!)!
        
        /*
         Force unwrap style
         guard let w = Double(weightTF.text!) else {
             print("Invalid input")
             return
         }
         guard let h = Double(heightTF.text!) else {
             print("Invalid input")
             return
         }
         var BMI = w/(h*h)
         */
        
        
        // Note: if input is "abc" or "" or " " or "." it returns nil.
        
        //Guard style
        guard let w = weightTF.text else {
            print("Invalid input")
            return
        }
        guard let h = heightTF.text else {
            print("Invalid input")
            return
        }
        
        guard let wVal = Double(w) else {
            print("Invalid input")
            return
        }
        guard let hVal = Double(h) else {
            print("Invalid input")
            return
        }
        
        let BMI = wVal/(hVal*hVal)
        print("BMI: \(BMI)")
        
        result.text = "Your BMI is \(BMI)"
    }

}

//#Preview {
//    ViewController()
//}

