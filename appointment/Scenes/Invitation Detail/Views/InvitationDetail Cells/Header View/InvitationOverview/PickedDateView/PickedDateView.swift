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

class PickedDateView: UIView {

    enum PickedDateState: Equatable {
        case withoutTime, withTime(time: String)
    }

    // MARK: - Outlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "PickedDateView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "PickedDateView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    func setupLayout() {
        //swiftlint:disable:next discouraged_object_literal
        imageView.image = state == .withoutTime ? #imageLiteral(resourceName: "popUp_dateConfirmation") : #imageLiteral(resourceName: "popUp_dateSugesstion_outgoing")
        subDescriptionLabel.text = state == .withoutTime ? "Wil je deze uinodiging toevoegen?" : "Deze datum toevoegen aan beschikbare\ndata in d8e groepsgesprek?"
        setupButtonTitles(leftTitle: state == .withoutTime ? "ANNULEREN" : "NIET TOEVOEGEN", rightTitle: state == .withoutTime ? "TOEVOEGEN AAN AGENDA" : "TOEVOEGEN")
        switch state {
        case .withoutTime:
            descriptionLabel.text = "De geprikte van de groep Party staat\n nog niet in je agenda"
        //swiftlint:disable:next superfluous_disable_command
        case .withTime:
            descriptionLabel.text = "Er is een nieuwe datum voorgesteld \n door Job Nijdam in Party op:\n 20 Mei 2015 van 15:00 - 17:00"
        }
    }

    func setupButtonTitles(leftTitle: String, rightTitle: String) {
        rightButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 1)
        leftButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 1)
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

extension PickedDateView: CustomViewProtocol {}
