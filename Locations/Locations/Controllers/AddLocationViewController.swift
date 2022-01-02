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
    
    var location: Location?
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func AddLocationPressedButton(_ sender: Any) {
        if let error = validationInput(){
            self.alertMassage()
            print(error)
        }
        else{
            guard let lat = Double(latitudeTextField.text!),let long = Double(longitudeTextField.text!)
            else{
                print("There is an error in data")
                alertMassage()
                return
            }
            self.location = Location(name: locationNameTextField.text ?? "", lat: lat, long: long)
            OpenWikipedia(location: location!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    func alertMassage(){
        let alert = UIAlertController(title: "Error", message: "Please enter latitude & longitude", preferredStyle: .alert)
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
    
    func validationInput() -> String?{
        if latitudeTextField.text == "" || longitudeTextField.text == ""{
            return "Please enter the latitude & longitude"
        }
        return nil
    }
    
    // Dismiss the keyboard by touching anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

