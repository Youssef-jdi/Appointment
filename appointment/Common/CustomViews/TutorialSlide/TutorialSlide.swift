//
//  TutorialSlide.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import Nuke

class TutorialSlide: UIView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageAndDescriptionVerticalSpacing: NSLayoutConstraint!
    
    func configure(_ tutorial: Tutorial) {
//        no view in designs for: tutorial.title
        descriptionLabel.text = tutorial.description
        activityIndicator.stopAnimating()
//        activityIndicator.startAnimating()
        
        #warning("url from server is broken, this url is only for testing purposes.")
        imageView.image = R.image.tutorial_low_quality_image()!
//        if let url = URL(string: "https://static02.nyt.com/images/2016/07/02/arts/nf-obits-kahlo/nf-obits-kahlo-jumbo.jpg") {
//            Nuke.loadImage(with: url, into: imageView) { [weak activityIndicator] _ in
//                activityIndicator?.stopAnimating()
//            }
//        }
    }
}
