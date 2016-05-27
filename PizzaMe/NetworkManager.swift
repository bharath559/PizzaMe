//
//  NetworkManager.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import Foundation


class NetworkManager{
    
    var baseUrlString = "https://query.yahooapis.com/v1/public/yql?q=select * from local.search where zip="
    static let sharedInstance = NetworkManager()
    
    
    func execNetworkCall(urlString: String, completion:(data:NSData,response: AnyObject!, error: NSError?) -> Void ) {
        
        let urlStr = urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        let nsURl = NSURL(string: urlStr!)
        let request = NSMutableURLRequest(URL: nsURl!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            
            do{
                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as! [String:AnyObject]
                //print(jsonData["results"])
                
                if let results = jsonData["query"] as? [String:AnyObject]{
                    
                    if let eachResult = results["results"] as? [String:AnyObject]{
                        
                        let placesArray = eachResult["Result"] as? NSArray
                        let placeDetail = PlaceDetail()
                        
                        placeDetail.getDataFromJson(placesArray!)
                        
                    }
                }
                
            }
            catch{
                
            }

        }
        dataTask.resume()
    }
    
    func buildParameters(zipcode:String) -> String{
        
      let baseUrlStringWithZip = baseUrlString+"'"+zipcode+"'"
      let finalUrl = baseUrlStringWithZip.stringByAppendingString(" and query='pizza'&format=json&diagnostics=true&callback=")
        
      return finalUrl
        
    }
    
}