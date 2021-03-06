//
//  Utils.swift
//  Locations
//
//  Created by Alaa Khalil on 02/01/2022.
//

import Foundation
import UIKit


func OpenWikipedia(location: Location, controller: UIViewController){
    let wikiUrlString = String(format: wikiDeepLink, location.name ?? "", location.lat, location.long)
    let wikiUrl = URL(string: wikiUrlString)! as URL
    print(wikiUrl)
    if (UIApplication.shared.canOpenURL(wikiUrl)) {
        UIApplication.shared.open(wikiUrl)
    }
    Alert.instance.alertMassage(message: "You need to install wikipedia App", controller: controller)
}

