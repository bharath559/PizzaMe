//
//  LocationManager.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import Foundation
import CoreLocation
import MobileCoreServices


protocol PlaceDetailDelegate:class {
    func didFinishUserLocation(zipCode:String)
}

class LocationManager:NSObject, CLLocationManagerDelegate{
    
    let locationmanager = CLLocationManager()
    static let sharedLocationManager = LocationManager()
    
    weak var delegate:PizzaListTableViewController?
    
    var userZipCode:String?
    var startLocation:CLLocation?
    
    override init(){
        
        super.init()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
       
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        NSThread.sleepForTimeInterval(0.10)
        
        locationmanager.stopUpdatingLocation()
       
        startLocation = locations[locations.count - 1]
        self.convertLocationToPostalCode(startLocation!)
    }
    
    func convertLocationToPostalCode(location:CLLocation){
        
        let geoCoder = CLGeocoder()
        var zipCode:String?
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            
            
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                
                self.userZipCode = pm.postalCode!
                self.delegate?.didFinishUserLocation(self.userZipCode!)
            }
            else {
                print("Problem with the data received from geocoder")
            }
        }
       
    }
    
       
    
}
