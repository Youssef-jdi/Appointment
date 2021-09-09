//
//  FooterView.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/11/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import MapKit

class InvitationDetailFooterView: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupMap(invitation: Appointment?) {
        guard let invitation = invitation else { return }
        let annotation = MKPointAnnotation()
        annotation.coordinate = invitation.location
        mapView.setRegion(MKCoordinateRegion(center: invitation.location, latitudinalMeters: 500, longitudinalMeters: 500), animated: false)
        mapView.addAnnotation(annotation)
    }
}
