//
//  TimelineDayCollectionViewCell.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

/*
 Note: - According to workflow, the business logic for displaying appointments is:

 With several appointments on one day,
 the main icon should be displayed first
 and the order is:

 - Business
 - Standard
 - Group Memo
 - Memo To
 - M.O.M.
 - Memo

 - the timeline should also display the social media account that memo's were synched with

 - if there is no appointment today, there will be a red stripe on the current day
 */

// used both for weekly and monthly calendar to set day
class TimelineDayCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets
    @IBOutlet weak var appointmentNumberLabel: UILabel!
    @IBOutlet weak var appointmentTypeImageView: UIImageView!
    @IBOutlet weak var appointmentSyncTypeImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var endOfTimeUnitSideView: UIView!
    @IBOutlet weak var endOfTimeUnitBottomView: UIView!
    @IBOutlet weak var appointmentStackView: UIStackView!

    // MARK: Cell LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        resetCell()
    }

    func resetCell() {
        appointmentNumberLabel.text = ""
        dayLabel.text = ""

        lineView.backgroundColor = R.color.appBlue()
//        endOfTimeUnitSideView
//        endOfTimeUnitBottomView

        appointmentTypeImageView.image = nil
        appointmentSyncTypeImageView.image = nil
        appointmentStackView.isHidden = false
    }

    func configure(date: Date?, with appointments: [Appointment]) {
        endOfTimeUnitBottomView.makeDashedBorderLine()

        guard let date = date else {
            appointmentStackView.isHidden = true
            return
        }

        dayLabel.text = String(date.day)

        let origins = appointments.compactMap { $0.appointmentOrigin }
        let categories = appointments.compactMap { $0.appointmentCategory }.sorted { $0 > $1 }
        let types = appointments.compactMap { $0.appointmentType }.sorted { $0 > $1 }

        configureAppointmentSyncTypeImage(origins)

        if appointments.count != 0 {
            appointmentNumberLabel.text = "(\(appointments.count))"
        }

        if !categories.isEmpty {
            configureAppointmentCategoryImage(appointmentCategory: categories[0])
        } else if !types.isEmpty {
            configureAppointmentTypeImage(appointmentType: types[0])
        }

        let calendar = Calendar.calendarMonday

        if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
            lineView.backgroundColor = R.color.appDarkRed()!
        }
    }

    // TO DO: make date extension to handle current date, end of time unit views

    //        let isCurrentDay: Bool
    //        let shouldShowBottomView: Bool
    //        let shouldShowSideView: Bool

    //        if model.isCurrentDay {
    //            lineView.backgroundColor = R.color.appDarkRed()!
    //        }

    //        appointmentNumberLabel.isHidden = true
    //        appointmentSyncTypeImageView.isHidden = true
    //        appointmentTypeImageView.isHidden = true
}

// MARK: Private Helpers
private extension TimelineDayCollectionViewCell {

    func configureAppointmentCategoryImage(appointmentCategory: AppointmentCategory) {
        switch appointmentCategory {
        case .standard:
            appointmentTypeImageView.image = R.image.appointment_regular_white()!.withRenderingMode(.alwaysTemplate)
        case .group:
            appointmentTypeImageView.image = R.image.appointment_group_white()!.withRenderingMode(.alwaysTemplate)
        case .memo:
            appointmentTypeImageView.image = R.image.appointment_memo_white()!.withRenderingMode(.alwaysTemplate)
        case .business:
            appointmentTypeImageView.image = R.image.appointment_business_white()!.withRenderingMode(.alwaysTemplate)
        case .unknown:
            assertionFailure()
        }
    }

    func configureAppointmentTypeImage(appointmentType: AppointmentType) {
        switch appointmentType {
        case .memo:
            appointmentTypeImageView.image = R.image.appointment_mom_white()!.withRenderingMode(.alwaysTemplate)
        case .invite:
            appointmentTypeImageView.image = R.image.appointment_memo_white()!.withRenderingMode(.alwaysTemplate)
        case .memoTo:
            appointmentTypeImageView.image = R.image.appointment_memoto_white()!.withRenderingMode(.alwaysTemplate)
        case .mom:
            appointmentTypeImageView.image = R.image.appointment_mom_white()!.withRenderingMode(.alwaysTemplate)
        case .chat:
            break
        case .unknown:
            assertionFailure()
        }
    }

    func configureAppointmentSyncTypeImage(_ origins: [AppointmentOrigin]) {
        guard !origins.isEmpty else { return }
        let appointmentSyncType = origins[0]
        
        switch appointmentSyncType {
        case .facebook:
            appointmentSyncTypeImageView.image = R.image.menu_Linked_Facebook()!
        case .google:
            appointmentSyncTypeImageView.image = R.image.menu_Linked_Google()!
        case .outlook:
            appointmentSyncTypeImageView.image = R.image.menu_Linked_Outlook()!
        case .yahoo:
            appointmentSyncTypeImageView.image = R.image.menu_Linked_Yahoo()!
        case .contacts:
            appointmentSyncTypeImageView.image = R.image.menu_Meeting()!
        default: break
        }
    }
}
