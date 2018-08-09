//
//  MyRideCell.swift
//  MyRides
//
//  Created by Joe Mathew on 7/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import UIKit

class MyRideCell: UICollectionViewCell {

    @IBOutlet weak var rideImageView: UIImageView!
    @IBOutlet weak var rideNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.autoresizingMask.insert(.flexibleHeight)
        self.contentView.autoresizingMask.insert(.flexibleWidth)
        self.contentView.translatesAutoresizingMaskIntoConstraints = true

    }
    
}
