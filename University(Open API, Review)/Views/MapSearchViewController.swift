//
//  MapSearchViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 5/16/22.
//

import UIKit
import MapKit
import CoreLocation

class MapSearchViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfLocationEnabled()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    //: Location Manager
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    
    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled()
        { setupLocationManager()
        } else {
            // build alert to say location is not enabled
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse: break
            // Where zipcode information will go
            centerViewOnUserLocation()
        case .denied: break
            // show alert showing them how to turn on permissions, general, settings, etc.
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted: break
            // set up alert for said blockage (Parental Control, In App Block, etc.)
        case .authorizedAlways: break
            
        @unknown default: "Sorry, there has been an unexpected error. \(UserError.unableToDecode)"
        }
    }
    
    // Center in func, to be swapped out for Zipcode function?
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
        
    }
}



extension MapSearchViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

// with zipcodes possibly build a function that cna check multiple locations, ansd make a seperate college sppear with it beinng able to be added to a list.


// Step 1: setup location manager
// Step 2: check whether location services are enabled on user's phone
// Step 3:

// also what you could do is set a name label, when the search is found, then have it link into another view controller with the details 


