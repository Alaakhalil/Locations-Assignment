//
//  Alert.swift
//  Locations
//
//  Created by Alaa Khalil on 03/01/2022.
//

import Foundation
import UIKit

class Alert: UIViewController{
    static let instance = Alert()
    func alertMassage(message: String, controller:UIViewController){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            default:
                print("default")
            }
        }))
        controller.present(alert, animated: true, completion: nil)
    }
}
