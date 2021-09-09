//
//  PickedDateView.swift
//  appointment
//
//  Created by Tran Gia Huy on 31/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol PickedDateViewDelegate: class {
    func leftButtonTapped()
    func rightButtonTapped()
}

class PickedDateView: UITableViewCell {

    enum PickedDateState: Equatable {
        case withoutTime, withTime(time: String)
    }

    // MARK: - Outlet
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var subDescriptionLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var cellContentView: UIView!

    // MARK: - Properties
    private var state: PickedDateState = .withoutTime
    private weak var delegate: PickedDateViewDelegate?

    // MARK: - Setup
    func set(state: PickedDateState) {
        self.state = state
    }

    func set(delegate: PickedDateViewDelegate) {
        self.delegate = delegate
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    private func setupLayout() {
        setupShadow(for: leftButton)
        setupShadow(for: rightButton)
        //swiftlint:disable:next discouraged_object_literal
        logoImageView.image = state == .withoutTime ? #imageLiteral(resourceName: "Pop-up_Icon") : #imageLiteral(resourceName: "popUp_dateSugesstion_outgoing")
       // subDescriptionLabel.text = state == .withoutTime ? "Wil je deze uinodiging toevoegen?" : "Deze datum toevoegen aan beschikbare\ndata in d8e groepsgesprek?"
        setupButtonTitles(leftTitle: state == .withoutTime ? "NIET TOEVOEGEN" : "NIET TOEVOEGEN", rightTitle: state == .withoutTime ? "TOEVOEGEN" : "TOEVOEGEN")
//        switch state {
//        case .withoutTime:
//            descLabel.text = "De geprikte van de groep Party staat\n nog niet in je agenda"
//        case .withTime:
//            descLabel.text = "Er is een nieuwe datum voorgesteld \n door Job Nijdam in Party op:\n 20 Mei 2015 van 15:00 - 17:00"
//        }
    }

    private func setupShadow(for view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    func setupButtonTitles(leftTitle: String, rightTitle: String) {
        rightButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 0)
        leftButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 0)
        leftButton.addBorder(side: .right, color: R.color.appDimGray()!, width: 1)
        leftButton.setTitle(leftTitle, for: .normal)
        rightButton.setTitle(rightTitle, for: .normal)
    }

    @IBAction func tappedLeftButton(_ sender: Any) {
        delegate?.leftButtonTapped()
    }
    @IBAction func tappedRightButton(_ sender: Any) {
        delegate?.rightButtonTapped()
    }
}
