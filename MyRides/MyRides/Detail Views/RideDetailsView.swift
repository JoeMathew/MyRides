//
//  RideDetailsView.swift
//  MyRides
//
//  Created by Joe Mathew on 8/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import Foundation
import UIKit

class RideDetailsView: UIView {
    
    public var theRide : MyRide?
    @IBOutlet var ContentView: UIView!
    
    
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var regoTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var vehicleTypeTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
    
    let viewModel = RideDetailViewModel()

    convenience init(frame: CGRect, ride : MyRide) {
        self.init(frame : frame)
        theRide = ride
        setRideDetails()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        theRide = MyRide()
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func enableEditForAllFields(allowEdit : Bool) -> Void {
        self.brandTextField.isEnabled = allowEdit
        self.modelTextField.isEnabled = allowEdit
        self.yearTextField.isEnabled = allowEdit
        self.colorTextField.isEnabled = allowEdit
        self.vehicleTypeTextField.isEnabled = allowEdit
        self.commentsTextView.isEditable = allowEdit
        self.commentsTextView.isSelectable = allowEdit
        self.regoTextField.isEnabled = false
    }
    
    fileprivate func setRideDetails() {
        if let myRide = theRide {
            self.brandTextField.text = myRide.brand
            self.modelTextField.text = myRide.model
            self.yearTextField.text = myRide.year
            self.regoTextField.text = myRide.rego
            self.colorTextField.text = myRide.color
            self.vehicleTypeTextField.text = myRide.vehicleType
            self.commentsTextView.text = myRide.comments
            
            if myRide.rego == "" {
                self.enableEditForAllFields(allowEdit: true)
                self.regoTextField.isEnabled = true
            }
        }
    }
    
    func commonInit() -> Void {
        Bundle.main.loadNibNamed("RideDetailsView", owner: self, options: nil)
        addSubview(ContentView)
        ContentView.frame = self.bounds
        ContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    public func saveRideDetailsFromView() {
        if let myRide = theRide {

            if myRide.rego == "" {  // New Entry. Add myRide to realm
                myRide.rego = self.regoTextField.text ?? ""
                myRide.brand = self.brandTextField.text ?? ""
                myRide.model = self.modelTextField.text ?? ""
                myRide.year  = self.yearTextField.text ?? ""
                myRide.color = self.colorTextField.text ?? ""
                myRide.vehicleType = self.vehicleTypeTextField.text ?? ""
                myRide.comments = self.commentsTextView.text ?? ""
                if myRide.rego == "" {
                    return         // Display Error Message, because rego is mandatory field, being the primary key
                } else {
                    viewModel.addNewRideDetails(ride: myRide)
                }
            } else {
                viewModel.updateDetailsFor(ride : myRide,
                                          brand : self.brandTextField.text,
                                          model : self.modelTextField.text,
                                           year : self.yearTextField.text,
                                          color : self.colorTextField.text,
                                    vehicleType : self.vehicleTypeTextField.text,
                                       comments : self.commentsTextView.text)
            }
        }
    }

}
