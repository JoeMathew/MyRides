//
//  MyRide.swift
//  MyRides
//
//  Created by Joe Mathew on 7/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class MyRide: Object {
    @objc dynamic var brand = ""
    @objc dynamic var model = ""
    @objc dynamic var vehicleType = ""
    @objc dynamic var rego = ""
    @objc dynamic var year = ""
    @objc dynamic var color = ""
    @objc dynamic var odo = ""
    @objc dynamic var comments = ""
    
    override static func primaryKey() -> String? {
        return "rego"
    }
    
    convenience init(brand: String,
                     model: String,
              vehicleType : String,
                     rego : String,
                     year : String,
                    color : String,
                      odo : String,
                  comments: String)
    {
        self.init()
        self.brand = brand
        self.model = model
        self.vehicleType = vehicleType
        self.rego = rego
        self.year = year
        self.color = color
        self.odo = odo
        self.comments = comments
    }
}
