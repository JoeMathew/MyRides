//
//  RideDetailsVC.swift
//  MyRides
//
//  Created by Joe Mathew on 8/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import UIKit

class RideDetailsVC: UIViewController {

    var rideDetailsView : RideDetailsView?
    
    public var myRide : MyRide?
    var editButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.isNavigationBarHidden = false
        editButton = UIBarButtonItem(title: "Edit",
                                     style: .done,
                                    target: self,
                                    action: #selector(editBtnTapped))

        self.navigationItem.rightBarButtonItem = editButton
        if myRide != nil {
            rideDetailsView = RideDetailsView(frame: self.view.bounds, ride : myRide!)
            self.view.addSubview(rideDetailsView!)
            
            if myRide?.rego == "" {
                editButton?.title = "Save"
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        rideDetailsView?.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height - 50)
    }
    
    @objc func editBtnTapped() -> Void {
        if editButton?.title == "Edit" {
            rideDetailsView?.enableEditForAllFields(allowEdit: true)
            editButton?.title = "Save"
        } else {
            rideDetailsView?.enableEditForAllFields(allowEdit: false)
            rideDetailsView?.saveRideDetailsFromView()
            editButton?.title = "Edit"
        }
    }
}
