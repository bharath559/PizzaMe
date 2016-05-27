//
//  DetailViewController.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/26/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var detailItem:PlaceDetail?
    
    @IBOutlet weak var placeTitle: UILabel!
    
    @IBOutlet weak var btnAddress: UIButton!
    @IBOutlet weak var btnPhoneNumber: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.placeTitle.text = detailItem?.name
        
        self.btnAddress.setTitle(detailItem!.address!+" "+detailItem!.city!+" "+detailItem!.state!, forState: .Normal)
        self.btnPhoneNumber.setTitle(detailItem?.phoneNumber, forState: .Normal)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func openAddressInMap(sender: AnyObject) {
        
        
        let geocoder = CLGeocoder()
       
        geocoder.geocodeAddressString(self.btnAddress.titleLabel!.text!) { (placemarksOptional, error) -> Void in
            
            
            if let placemarks = placemarksOptional {
                print("placemark| \(placemarks.first)")
                if let location = placemarks.first?.location {
                    let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
                    let path = "http://maps.apple.com/" + query
                    if let url = NSURL(string: path) {
                        UIApplication.sharedApplication().openURL(url)
                    } else {
                        
                    }
                } else {
                                    }
            } else {
                print("no places found")
            }
        }
        
    }
    
    @IBAction func dialPhoneNumber(sender: AnyObject) {
        
        
        var phoneNumber = self.btnPhoneNumber.titleLabel!.text?.stringByReplacingOccurrencesOfString("(", withString: "")
        phoneNumber = phoneNumber!.stringByReplacingOccurrencesOfString(")", withString: "")
        phoneNumber = phoneNumber!.stringByReplacingOccurrencesOfString(" ", withString: "")
         phoneNumber = phoneNumber!.stringByReplacingOccurrencesOfString("-", withString: "")
        
        let urlString = "tel://"+phoneNumber!
        if let callUrl = NSURL(string: urlString) {
            UIApplication.sharedApplication().openURL(callUrl)
        }
        
    }
    


}
