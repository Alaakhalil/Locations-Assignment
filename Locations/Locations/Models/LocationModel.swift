//
//  LocationModel.swift
//  Locations
//
//  Created by Alaa Khalil on 30/12/2021.
//

import Foundation

struct LocationModel: Codable {
    let locations: [Location]?
}

struct Location: Codable {
    let name: String?
    let lat: Double
    let long: Double
}
