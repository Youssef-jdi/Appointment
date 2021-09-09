//
//  InvitationBasicInfoView.swift
//  appointment
//
//  Created by Irina Filkovskaya on 30.06.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationBasicInfoView: UIView, CustomViewProtocol {
    // MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressStackView: UIStackView!
    @IBOutlet weak var participantsStackView: UIStackView!
    @IBOutlet weak var containerStackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "InvitationBasicInfoView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "InvitationBasicInfoView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configure(for viewModel: AppointmentBasicViewModel) {
        titleLabel.text = viewModel.title
        creatorLabel.text = viewModel.creator
        createdAtLabel.text = viewModel.createdAt
        descriptionLabel.text = viewModel.description

        typeImageView.image = viewModel.image
        participantsLabel.text = viewModel.participants
//        "\(invitation.participants?.count ?? 0) people invited" // TODO: Localize
//        if invitation.appointmentCategory == .business || invitation.appointmentCategory == .standard {
//            participantsStackView.isHidden = true
//        }
        guard !viewModel.location.isEmpty else {
            addressStackView.isHidden = true
            return
        }
        locationLabel.text = viewModel.location
    }
    
    func edit() {    // TODO: Implement saving
        let descriptionTextField = UITextField()
        descriptionTextField.frame = descriptionLabel.frame
        containerStackView.addArrangedSubview(descriptionTextField)
//        addSubview(descriptionTextField)
        descriptionTextField.textColor = .black
        descriptionTextField.borderStyle = .line
        descriptionTextField.text = descriptionLabel.text
        descriptionLabel.isHidden = true
        descriptionTextField.becomeFirstResponder()
    }
    
    func update(description: String) {
        if let textField = containerStackView.arrangedSubviews.last as? UITextField {
            containerStackView.removeArrangedSubview(textField)
            textField.removeFromSuperview()
            descriptionLabel.text = description
            descriptionLabel.isHidden = false
        }
    }
    
    func description() -> String {
        guard let textField = containerStackView.arrangedSubviews.last as? UITextField else { return "" }
        return textField.text ?? ""
    }
}
