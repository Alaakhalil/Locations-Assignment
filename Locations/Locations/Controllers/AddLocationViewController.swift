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
            Alert.instance.alertMassage(message: "Please enter latitude & longitude", controller: self)
            print(error)
        }
        else{
            guard let lat = Double(latitudeTextField.text!),let long = Double(longitudeTextField.text!)
            else{
                Alert.instance.alertMassage(message: "Please enter latitude & longitude", controller: self)
                return
            }
            self.location = Location(name: locationNameTextField.text ?? "", lat: lat, long: long)
            OpenWikipedia(location: location!, controller: self)
        }
    }
    
    func validationInput() -> String?{
        if latitudeTextField.text == "" || longitudeTextField.text == ""{
            return "Please enter the latitude & longitude"
        }
        return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

