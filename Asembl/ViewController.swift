//
//  ViewController.swift
//  Asembl
//
//  Created by Chris David on 12/15/18.
//  Copyright © 2018 Chris David. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //MAP
    @IBOutlet weak var mapButton: UIBarButtonItem!
    
    @IBOutlet weak var mapView: MKMapView!
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        
        // Button to Add Event
        
        plusButton.layer.cornerRadius = 25
        plusButton.clipsToBounds = true
        
        
        
        //More Map
        
        mapView.delegate = self as? MKMapViewDelegate
        
        locationManager = CLLocationManager()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check for Location Services
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // MARK - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                mapView.setRegion(viewRegion, animated: false)
            }
        }
    }
    
    func sideMenus (){
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            // Set Width of Reveal View
            revealViewController()?.rearViewRevealWidth = 275
            revealViewController()?.rightViewRevealWidth = 160
            
            
            mapButton.target = revealViewController()
            mapButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
