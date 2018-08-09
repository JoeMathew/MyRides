//
//  RideDetailViewModel.swift
//  MyRides
//
//  Created by Joe Mathew on 10/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import Foundation

import Realm
import RealmSwift

class RideDetailViewModel {
    
    public func updateDetailsFor(ride : MyRide,
                                 brand : String?,
                                 model : String?,
                                 year : String?,
                                 color : String?,
                                 vehicleType : String?,
                                 comments : String?) -> Void
    {
        let realm = try! Realm()
        
        realm.beginWrite()
        ride.brand = brand ?? ""
        ride.model = model ?? ""
        ride.year  = year ?? ""
        ride.color = color ?? ""
        ride.vehicleType = vehicleType ?? ""
        ride.comments = comments ?? ""
        try! realm.commitWrite()
    }
    
    public func addNewRideDetails(ride : MyRide) -> Void {
        let realm = try! Realm()
        realm.beginWrite()
        realm.add(ride)
        try! realm.commitWrite()
    }
    
}
