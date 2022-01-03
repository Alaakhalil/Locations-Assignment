//
//  LocationsViewController.swift
//  Locations
//
//  Created by Alaa Khalil on 23/12/2021.
//

import UIKit

class LocationsViewController: UIViewController {
    
    @IBOutlet weak var locationTableView: UITableView!
    var locations = [Location]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getLocations()
        // Do any additional setup after loading the view.
    }
    // Fetching the data from Api
    func getLocations(){
        ServerManger.shared.getHouses{ response, error in
            if error == nil{
                self.locations = response.locations!
            }
            self.locationTableView.reloadData()
        }
    }
}

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationsTableViewCell
        let location = self.locations[indexPath.row]
        cell.LocationNameLabel.text = location.name ?? "Unknwon"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        OpenWikipedia(location: self.locations[indexPath.row], controller: self)
    }
}

