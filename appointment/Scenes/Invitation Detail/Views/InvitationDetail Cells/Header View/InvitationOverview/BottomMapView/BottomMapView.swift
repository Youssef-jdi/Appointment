//
//  BottomMapView.swift
//  appointment
//
//  Created by Tran Gia Huy on 31/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import MapKit

protocol BottomMapViewDelegate: class {
    func tappedLeftButton()
    func tappedRightButton()
}

class BottomMapView: UIView {

    // MARK: - Outlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var rightButton: UIView! {
        didSet {
            rightButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedRightButton)))
        }
    }
    @IBOutlet weak var leftButton: UIView! {
        didSet {
            leftButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLeftButton)))
        }
    }
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var rightIcon: UIImageView!

    // MARK: - Properties
    private weak var delegate: BottomMapViewDelegate?

    // MARK: - Setup
    func set(delegate: BottomMapViewDelegate) {
        self.delegate = delegate
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "BottomMapView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "BottomMapView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        setButtonTitles()
    }

    func setupLayout() {
        //swiftlint:disable:next discouraged_object_literal
        leftIcon.image = #imageLiteral(resourceName: "weiger_afspraak")
        //swiftlint:disable:next discouraged_object_literal
        rightIcon.image = #imageLiteral(resourceName: "ic_new_date").withRenderingMode(.alwaysOriginal)
    }

    func setButtonTitles() {
        #warning("TODO,Sam,2020-03-31, Localization")
        leftLabel.text = "AFSPRAAK \nANNULEREN"
        rightLabel.text = "STEL NIEUWE \nDATUM VOOR"
    }
}

@objc extension BottomMapView {
    func tappedRightButton() {
        delegate?.tappedRightButton()
    }

    func tappedLeftButton() {
        delegate?.tappedLeftButton()
    }
}

extension BottomMapView: CustomViewProtocol {}
