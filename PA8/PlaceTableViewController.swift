//
//  ViewController.swift
//  PA8
//
//  Created by Kevin Lunden on 12/3/20.
//

import UIKit
import CoreLocation

class PlaceTableViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {

    //@IBOutlet var latitudeLabel: UILabel!
    //@IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if CLLocationManager.locationServicesEnabled() {
            print("enabled")
            setupLocationServices()
        }
        else {
            print("disabled")
        }
    }

    func setupLocationServices() {
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let location = locations[locations.count - 1]
        //latitudeLabel.text = "\(location.coordinate.latitude)"
        //longitudeLabel.text = "\(location.coordinate.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error requesting location")
        // notable error codes
        // 0: there is no location (simulator location is none)
        // 1: access denied
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // called everytime the text changes in the search bar
            print(searchText)
            if searchText != "" {
                performSearch(searchBar: searchBar)
            }
            else {
                // search bar is empty
                searchBar.resignFirstResponder()
                //loadItems() // load all the items
            }
    }
        
    func performSearch(searchBar: UISearchBar) {
        // grab the text from the search bar
        if let text = searchBar.text {
            // MARK: lab #11.a.
            // create a predicate to filter items
            // by text
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@", text)
            //loadItems(withPredicate: predicate)
        }
    }
    
}

