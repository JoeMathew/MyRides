//
//  RidesListViewModel.swift
//  MyRides
//
//  Created by Joe Mathew on 10/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RidesListViewModel {
    
    public func numSections() -> Int {
        // Get the default Realm
        let realm = try! Realm()
        
        //Get the number of sections by filtering the rides by type
        let myRideTypes = realm.objects(MyRide.self).sorted(by: ["vehicleType"]).distinct(by: ["vehicleType"])
        return myRideTypes.count

    }

    public func numItemsInSection(section : Int) -> Int {
        // Get the default Realm
        let realm = try! Realm()
        
        //Get the number of sections by filtering the rides by type. Can handle any type, but now limiting to 3
        var numItems : Int = 0;
        switch section {
        case 0:
            let myCars  = realm.objects(MyRide.self).filter("vehicleType = %@", "Car")
            numItems    = myCars.count
            break
        case 1:
            let myBikes = realm.objects(MyRide.self).filter("vehicleType = %@", "Motorcycle")
            numItems    = myBikes.count
            break
        case 2:
            let myBoats = realm.objects(MyRide.self).filter("vehicleType = %@", "Boat")
            numItems    = myBoats.count
            break
        default:
            break
        }
        return numItems
    }
    
    public func rideNameForIndexPath(indexPath : IndexPath) -> String {
        
        var rideName : String = ""
        let realm = try! Realm()
        
        switch indexPath.section {
        case 0:
            let myCars  = realm.objects(MyRide.self).filter("vehicleType = %@", "Car")
            let thisCar = myCars[indexPath.item]
            rideName = thisCar.brand + " " + thisCar.model
            break
            
        case 1:
            let myBikes  = realm.objects(MyRide.self).filter("vehicleType = %@", "Motorcycle")
            let thisBike = myBikes[indexPath.item]
            rideName = thisBike.brand + " " + thisBike.model
            break
            
        case 2:
            let myBoats  = realm.objects(MyRide.self).filter("vehicleType = %@", "Boat")
            let thisBoat = myBoats[indexPath.item]
            rideName = thisBoat.brand + " " + thisBoat.model
            break
            
        default:
            break
        }

        return rideName
    }
    
    public func rideImageForIndexPath(indexPath : IndexPath) -> UIImage {
        //For now return a generic image for the ride category
        switch indexPath.section {
        case 0:
            return #imageLiteral(resourceName: "Car.png")
            
        case 1:
            return #imageLiteral(resourceName: "Bike.png")
            
        case 2:
            return #imageLiteral(resourceName: "Boat.png")
            
        default:
            return #imageLiteral(resourceName: "Car.png")
        }
    }

    func getItemAtIndexPath(indexPath : IndexPath) -> MyRide {
        // Get the default Realm
        let realm = try! Realm()
        
        var thisRide : MyRide?
        
        switch indexPath.section {
        case 0:
            let myCars  = realm.objects(MyRide.self).filter("vehicleType = %@", "Car")
            thisRide = myCars[indexPath.item]
            
            break
            
        case 1:
            let myBikes  = realm.objects(MyRide.self).filter("vehicleType = %@", "Motorcycle")
            thisRide = myBikes[indexPath.item]
            break
            
        case 2:
            let myBoats  = realm.objects(MyRide.self).filter("vehicleType = %@", "Boat")
            thisRide = myBoats[indexPath.item]
            break
            
        default:
            break
        }

        return thisRide ?? MyRide()
    }
    
    func titleForSection(section : Int) -> String {
        
        var title  = ""
        switch section {
        case 0:
            title = "Cars"
            break
            
        case 1:
            title = "Motorcycles"
            break
            
        case 2:
            title = "Boats"
            break
            
        default:
            break
        }

        return title
    }
}
