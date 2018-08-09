//
//  MyRidesListView.swift
//  MyRides
//
//  Created by Joe Mathew on 6/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import Foundation
import UIKit

protocol RidesListViewDelegate {
    func didSelect(ride : MyRide) -> Void
}

class MyRidesListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var myRidesList: UICollectionView!
    
    let viewModel = RidesListViewModel()
    
    public var delegate : RidesListViewDelegate?
    
    convenience init(frame : CGRect, delegate : RidesListViewDelegate) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
    
        Bundle.main.loadNibNamed("MyRidesListView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //Register the cells
        myRidesList.register(UINib(nibName: "MyRideCell", bundle: nil), forCellWithReuseIdentifier: "myridecell")
        
        //Register the section headers
        let headerNib = UINib(nibName: "RidesListSectionHeader",bundle: nil)
        myRidesList.register(headerNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: "rideslistsectionheader")

        //Accessibility
        myRidesList.accessibilityLabel = "main-list"
    }

    public func reloadList() -> Void {
        myRidesList.reloadData()
    }
    

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MyRideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myridecell", for: indexPath) as! MyRideCell
        
        cell.rideNameLabel.text = viewModel.rideNameForIndexPath(indexPath: indexPath)
        cell.rideImageView.image = viewModel.rideImageForIndexPath(indexPath: indexPath)
        return cell
    }

    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let thisRide = viewModel.getItemAtIndexPath(indexPath: indexPath)
        if self.delegate != nil {
            self.delegate?.didSelect(ride: thisRide)
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:414 , height: 30.0)
    }

    
    func collectionView(_ collectionView: UICollectionView,
                                viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView
    {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                             withReuseIdentifier:"rideslistsectionheader", for: indexPath) as! RidesListSectionHeader
            
            headerView.SectionTitleLabel.text = viewModel.titleForSection(section:indexPath.section)
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
}
