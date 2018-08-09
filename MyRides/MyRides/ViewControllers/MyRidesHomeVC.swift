//
//  MyRidesHomeVC.swift
//  MyRides
//
//  Created by Joe Mathew on 6/8/18.
//  Copyright © 2018 Joe Mathew. All rights reserved.
//

import UIKit

class MyRidesHomeVC: UIViewController, RidesListViewDelegate {

    lazy var ridesListView : MyRidesListView = MyRidesListView(frame: self.view.bounds, delegate : self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(ridesListView)
    }

    override func viewDidLayoutSubviews() {
        ridesListView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height - 100)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isNavigationBarHidden = true
        ridesListView.reloadList()
    }

    @IBAction func addNewButtonTapped(_ sender: Any) {
        let detailsVC = RideDetailsVC(nibName: "RideDetailsVC", bundle: nil)
        detailsVC.myRide = MyRide()
        if let nav = self.navigationController {
            nav.pushViewController(detailsVC, animated: true)
        }
    }
    
    // MARK: RidesListViewDelegate
    func didSelect(ride: MyRide) {
        let detailsVC = RideDetailsVC(nibName: "RideDetailsVC", bundle: nil)
        detailsVC.myRide = ride
        if let nav = self.navigationController {
            nav.pushViewController(detailsVC, animated: true)
        }
    }
}
