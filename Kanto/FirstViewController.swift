//
//  FirstViewController.swift
//  Kanto
//
//  Created by Nguyen Tam Anh Bui on 6/28/18.
//  Copyright © 2018 Nguyen Tam Anh Bui. All rights reserved.
//

import UIKit
import MapKit


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // Example data, subject to change
    let bastille = Location(name: "Bastille", latitude: 48.853183, longitude: 2.369144)
    let hollywood = Location(name: "Hollywood", latitude: 34.092809, longitude: -118.328661)
    let stationF = Location(name: "Station F", latitude: 48.834810, longitude: 2.370764)
    let school = Location(name: "Ecole 42 de Paris", latitude: 48.896549, longitude: 2.318461)
    lazy var locations = [bastille, hollywood, stationF, school]
    
    let mapSegueIdentifier = "ShowLocation"
    
    @IBOutlet weak var locationsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationTableViewCell
        cell.locationName.text = locations[indexPath.row].name
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == mapSegueIdentifier {
            let destination = segue.destination as? SecondViewController
            let locationIndex = locationsTable.indexPathForSelectedRow?.row
            destination?.initialLocation = CLLocation(latitude: locations[locationIndex!].latitude, longitude: locations[locationIndex!].longitude)
        }
        
    }
    
    
    
    
}

