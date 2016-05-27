//
//  PlaceDetail.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import Foundation

var placeDetailArray = [PlaceDetail]()

class PlaceDetail{
    
    var name:String?
    var address:String?
    var city:String?
    var state:String?
    var phoneNumber:String?
    var distance:String?
    var mapUrl:String?

    init(){


    }
    
    init(name:String, address:String, city:String, state:String, phoneNumber:String, distance:String,mapUrl:String){
        
        self.name = name
        self.address = address
        self.city=city
        self.state = state
        self.phoneNumber = phoneNumber
        self.distance = distance
        self.mapUrl = mapUrl
    }
    
    func getDataFromJson(jsonArray:NSArray) -> Void{
        
       
        print(placeDetailArray.count)
       
            
            print(jsonArray)
            for eachDetail in jsonArray{
                
                let placeDetail = PlaceDetail(name: eachDetail["Title"] as! String, address: eachDetail["Address"] as! String, city: eachDetail["City"] as! String, state: eachDetail["State"] as! String, phoneNumber: eachDetail["Phone"] as! String, distance: eachDetail["Distance"] as! String, mapUrl: eachDetail["MapUrl"] as! String)
                placeDetailArray.append(placeDetail)
                
            
        }

    }
    
}
