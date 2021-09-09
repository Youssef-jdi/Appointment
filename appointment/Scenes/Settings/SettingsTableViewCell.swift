//
//  SettingsTableViewCell.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

enum SettingType {
    case timeFormat
    case timelineType
    case statusOnTimeline
}

struct SettingsTableViewCellModel {
    let type: SettingsTableViewCell.CellType
    let title: String
}

protocol SettingsTableViewCellDelegate: class {
    func update(setting: SettingType, value: Bool)
}

class SettingsTableViewCell: UITableViewCell {

    enum CellType: Equatable {
        case header
        case withArrow
        case withSwitch(isActive: Bool, associatedSetting: SettingType)
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!

    weak var delegate: SettingsTableViewCellDelegate?
    var associatedSetting: SettingType?
    var model: SettingsTableViewCellModel?

    func configure(with model: SettingsTableViewCellModel) {
        self.model = model

        subtitleLabel.isHidden = true
        titleLabel.text = model.title

        switch model.type {
        case .header:
            cellSwitch.isHidden = true
            cellButton.isHidden = true

            titleLabel.font = R.font.openSansSemibold(size: 12)
            stackViewLeadingConstraint.constant = 10
            self.contentView.backgroundColor = R.color.appLightGray()!

        case .withArrow:
            cellSwitch.isHidden = true
            cellButton.isHidden = false

            titleLabel.font = R.font.openSansSemibold(size: 14)
            stackViewLeadingConstraint.constant = 40
            self.contentView.backgroundColor = .white

        case .withSwitch(let isActive, let setting):
            cellSwitch.isHidden = false
            cellButton.isHidden = true

            associatedSetting = setting
            cellSwitch.isOn = isActive

            titleLabel.font = R.font.openSansSemibold(size: 14)
            stackViewLeadingConstraint.constant = 40
            self.contentView.backgroundColor = .white

            updateSubtitleLabelTextIfNeeded(isActive: isActive)
        }
    }

    @IBAction func didTapSwitch(_ sender: UISwitch) {
        guard let setting = associatedSetting else { return assertionFailure() }
        print("setting", setting)
        delegate?.update(setting: setting, value: sender.isOn)

        updateSubtitleLabelTextIfNeeded(isActive: sender.isOn)
    }

    func updateSubtitleLabelTextIfNeeded(isActive: Bool) {
        guard let setting = associatedSetting, setting == .timelineType else { return }

        subtitleLabel.isHidden = false
        
        subtitleLabel.text = isActive
            ? R.string.localizable.week().uppercased()
            : R.string.localizable.month().uppercased()
    }
}
