//
//  AddLocationViewController.swift
//  Locations
//
//  Created by Alaa Khalil on 30/12/2021.
//

import UIKit

class AddLocationViewController: UIViewController {

    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var locationNameTextField: UITextField!
    
    @IBOutlet weak var latitudeTextField: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func validationInput() -> String?{
        if locationNameTextField.text == " " || latitudeTextField.text == " " || longitudeTextField.text == " "{
            return "Please enter the all data"
        }
        return nil
    }
    @IBAction func AddLocationPressedButton(_ sender: Any) {
        if let error = validationInput(){
            print(error)
        }
        else{
            guard let name = locationNameTextField.text,
                  let lat = Double(latitudeTextField.text!),
                  let long = Double(longitudeTextField.text!)
            else{
                print("There is an error in data")
                alertMassage()
                return
            }
            //send lat&long
            self.dismiss(animated: true, completion: nil)
        }
    }
    func alertMassage(){
        let alert = UIAlertController(title: "Error", message: "Please enter valid data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Dismiss the keyboard by touching anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

