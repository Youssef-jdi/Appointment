//
//  SettingsDataSource.swift
//  appointment
//
//  Created by Raluca Mesterca on 21/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol SettingsDataSourceProtocol: UITableViewDataSource {
    func setDataSource(isUserLoggedIn: Bool)
    func settingsToSave() -> Settings
}

class SettingsDataSource: NSObject, SettingsDataSourceProtocol {

    private(set) var isUserLoggedIn: Bool = false
    private(set) var dataSource: [SettingsTableViewCellModel] = []
    private(set) var settings: Settings?
    private(set) var settingsToUpdate: [SettingType: Bool] = [:]

    func setDataSource(isUserLoggedIn: Bool) {
        self.isUserLoggedIn = isUserLoggedIn
        dataSource = isUserLoggedIn
            ? cellModelForAuthenticatedUser()
            : cellModelForNonAuthenticatedUser()
    }

    func set(settings: Settings) {
        self.settings = settings
        setDataSource(isUserLoggedIn: isUserLoggedIn)
    }

    /// Prepares a model from the current setting data.
    func settingsToSave() -> Settings {
        // TO DO: Raluca, 04/06/2020
        // - implement rest of settings once click actions are done

        return Settings.defaultSettings(
//            userId: <#T##String?#>,
//            pushAppointments: <#T##String?#>,
//            pushInvites: <#T##String?#>,
//            pushAgenda: <#T##String?#>,
//            pushReminders: <#T##String?#>,
            status: settingsToUpdate[.statusOnTimeline]?.wrappedBool,
//            dateFormat: <#T##String?#>,
//            pushFeedback: <#T##String?#>,
//            pushBusiness: <#T##String?#>,
//            pushGroups: <#T##String?#>,
            language: Settings.appLanguage,
//            network: <#T##String?#>,
            timelineDisplay: settingsToUpdate[.timelineType]?.wrappedBool,
            timeFormat: settingsToUpdate[.timeFormat]?.wrappedBool
        )
    }
}

// MARK: UITableViewDataSource
extension SettingsDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.settingsTableViewCell, for: indexPath)
            else { return UITableViewCell() }

        cell.configure(with: dataSource[indexPath.row])
        cell.delegate = self

        return cell
    }
}

extension SettingsDataSource: SettingsTableViewCellDelegate {

    func update(setting: SettingType, value: Bool) {
        settingsToUpdate[setting] = value
    }
}

// MARK: Private Helpers
private extension SettingsDataSource {

    func cellModelForNonAuthenticatedUser() -> [SettingsTableViewCellModel] {
        return [
            SettingsTableViewCellModel(
                type: .header,
                title: R.string.localizable.general().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.connectedSettings().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .header,
                title: R.string.localizable.account().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.login().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.register().uppercased()
            )
        ]
    }

    func cellModelForAuthenticatedUser() -> [SettingsTableViewCellModel] {
        return [
            SettingsTableViewCellModel(
                type: .header,
                title: R.string.localizable.general().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.connectedSettings().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .header,
                title: R.string.localizable.account().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.editAccount().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .header,
                title: R.string.localizable.other().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withSwitch(
                    isActive: settings?.timeFormat?.wrappedBool ?? false,
                    associatedSetting: .timeFormat
                ),
                title: R.string.localizable.timeFormat().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withSwitch(
                    isActive: settings?.timelineDisplay?.wrappedBool ?? false,
                    associatedSetting: .timelineType
                ),
                title: R.string.localizable.timelineType().uppercased() + ":"
            ),

            SettingsTableViewCellModel(
                type: .withSwitch(
                    isActive: settings?.status?.wrappedBool ?? false,
                    associatedSetting: .statusOnTimeline
                ),
                title: R.string.localizable.timelineStatus().uppercased()
            ),

            SettingsTableViewCellModel(
                type: .withArrow,
                title: R.string.localizable.dateNotation().uppercased()
            )
        ]
    }
}
