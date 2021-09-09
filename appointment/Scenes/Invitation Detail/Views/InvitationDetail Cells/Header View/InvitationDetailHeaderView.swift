//
//  HeaderView.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/11/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationDetailHeaderView: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressStackView: UIStackView!
    @IBOutlet weak var participantsStackView: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Methods
    func setupHeaderView(invitation: Appointment?) {
        guard let invitation = invitation else { return }
        titleLabel.text = invitation.title
        creatorLabel.text = invitation.creatorName
        createdAtLabel.text = invitation.createdAt
        descriptionLabel.text = invitation.description
        
        if let textField = stackView.arrangedSubviews.last as? UITextField {
            let text = textField.text
            stackView.removeArrangedSubview(textField)
            textField.removeFromSuperview()
            descriptionLabel.text = text
            descriptionLabel.isHidden = false
        }
        
        typeImage.image = invitation.appointmentCategory.image
        participantsLabel.text = "\(invitation.participants?.count ?? 0) people invited" // TODO: Localize
//        if invitation.appointmentCategory == .business || invitation.appointmentCategory == .standard {
//            participantsStackView.isHidden = true
//        }
        guard let address = invitation.address else {
            addressStackView.isHidden = true
            return
        }
        
        locationLabel.text = address
    }
    
    func updateInvitationDetails(invitation: Appointment?) {
        setupHeaderView(invitation: invitation)
        
        let descriptionTextField = UITextField()
        descriptionTextField.frame = descriptionLabel.frame
        stackView.addArrangedSubview(descriptionTextField)
//        addSubview(descriptionTextField)
        descriptionTextField.textColor = .black
        descriptionTextField.borderStyle = .line
        descriptionTextField.text = descriptionLabel.text
        descriptionLabel.isHidden = true
        descriptionTextField.becomeFirstResponder()
    }
}
    
