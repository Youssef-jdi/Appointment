////
////  ParticipantTableViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 15/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Moya
//
//enum ParticipantCellType {
//    case select, delete
//}
//
//protocol ParticipantTableViewCellDelegate: class {
//    func setChecked(_ isChecked: Bool, sender: ParticipantTableViewCell)
//    func crossButtonTapped(sender: ParticipantTableViewCell)
//}
//
//class ParticipantTableViewCell: UITableViewCell {
//    
//    override var reuseIdentifier: String? { return "ParticipantTableViewCell" }
//    
//    @IBOutlet private weak var checkBoxButton: UIButton!
//    @IBOutlet private weak var profileImageView: UIImageView!
//    @IBOutlet private weak var nameLabel: UILabel!
//    @IBOutlet private weak var platformLabel: UILabel!
//    @IBOutlet private weak var crossButton: UIButton!
//    
//    @IBOutlet private weak var seperatorLeadingToProfileImageViewConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var seperatorLeadingToNameLabelConstraint: NSLayoutConstraint!
//    
//    private var isChecked: Bool = false
//    private var cellType: ParticipantCellType = .select
//    
//    weak var delegate: ParticipantTableViewCellDelegate?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        selectionStyle = .none
//        setupCellStyle()
//    }
//    
//    private func setupCellStyle() {
//        switch cellType {
//        case .select:
//            seperatorLeadingToProfileImageViewConstraint.priority = .defaultHigh
//            seperatorLeadingToNameLabelConstraint.priority = .defaultLow
//            platformLabel.isHidden = false
//            checkBoxButton.isHidden = false
//            crossButton.isHidden = true
//        case .delete:
//            seperatorLeadingToProfileImageViewConstraint.priority = .defaultLow
//            seperatorLeadingToNameLabelConstraint.priority = .defaultHigh
//            platformLabel.isHidden = true
//            checkBoxButton.isHidden = true
//            crossButton.isHidden = false
//        }
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
//        profileImageView.clipsToBounds = true
//    }
//    
//    @IBAction private func checkBoxButtonTapped(_ sender: Any) {
//        isChecked.toggle()
//        delegate?.setChecked(isChecked, sender: self)
//        let image = isChecked ? R.image.checkbox_On()! : R.image.checkbox_Off()!
//        checkBoxButton.setImage(image, for: .normal)
//    }
//    
//    @IBAction private func crossButtonTapped(_ sender: Any) {
//        delegate?.crossButtonTapped(sender: self)
//    }
//}
//
//extension ParticipantTableViewCell {
//    func configure(with user: UserDatum, cellType: ParticipantCellType = .select) {
//        self.cellType = cellType
//        
//        nameLabel.text = user.fullName
//    }
//}
