//
//  PizzaListTableViewController.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import UIKit


class PizzaListTableViewController: UITableViewController, PlaceDetailDelegate {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedLocationInstance?.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(placeDetailArray.count)
        return placeDetailArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailTableViewCell", forIndexPath: indexPath) as! DetailTableViewCell
        
        let placeDetail = placeDetailArray[indexPath.row] 
        
        cell.placeTitle.text = placeDetail.name
        cell.placeAddress.text = placeDetail.address!+" "+placeDetail.city!+" "+placeDetail.state!
        cell.distance.text = placeDetail.distance
        cell.phoneNumber.text = placeDetail.phoneNumber
        return cell
    }
    
    func didFinishUserLocation(zipCode:String) {
        
        let urlString = networkSharedInstance!.buildParameters((sharedLocationInstance?.userZipCode)!)
        
        print(urlString)
        networkSharedInstance!.execNetworkCall(urlString, completion: { (data,response, error) in
            
        })
        
        print(placeDetailArray)
        self.tableView.reloadData()
        
    }
  
    // MARK: - Navigation

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = placeDetailArray[indexPath.row] 
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }
}
