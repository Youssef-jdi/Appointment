////
////  PickerDataViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 07/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PickerDateViewController: BaseViewController {
//
//    @IBOutlet private weak var selectDataLabel: UILabel!
//    @IBOutlet private weak var pickerDate: UIDatePicker!
//
//    var helperDate = Date()
//    
//    lazy var popUpfirstButtonTitle: NSAttributedString = {
//        let firstButtonTitle = NSAttributedString (
//            string: R.string.localizable.addMoreData.key.localized.uppercased(),
//            attributes: [
//                .foregroundColor: R.color.appBlue()!,
//                .font: R.font.openSansBold(size: 20)!
//            ]
//        )
//        return firstButtonTitle
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addRightBarButtonItem()
//        helperDate = pickerDate.date
//
//        guard let calendarPageVC = self.children.first as? CalendarPageViewController else { return }
//        calendarPageVC.viewModel = CalendarPageViewController.ViewModel(currentDate: helperDate)
//    }
//    
//    @IBAction private func datePickerChanged(_ sender: UIDatePicker, forEvent event: UIEvent) {
//        abs(helperDate.timeIntervalSince1970 - pickerDate.date.timeIntervalSince1970) >= 86_400 ?
//            updateCalendarCurrentDate() : updateCalendarRow()
//    }
//    
//    func addRightBarButtonItem() {
//        let rightButton = UIButton(type: .custom)
//        rightButton.translatesAutoresizingMaskIntoConstraints = false
//        rightButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
//        rightButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
//        rightButton.setImage(R.image.add_Icon_White(), for: .normal)
//        rightButton.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
//        let rigtBarButton = UIBarButtonItem(customView: rightButton)
//        rightButton.sizeToFit()
//        navigationItem.rightBarButtonItem = rigtBarButton
//        rigtBarButton.tintColor = .white
//    }
//
//    func updateCalendarRow() {
//        guard let calendarPageVC = self.children.first as? CalendarPageViewController,
//            let currentPage = calendarPageVC.viewControllers?.first as? CalendarTableViewController else { return }
//
//        helperDate = pickerDate.date
//        calendarPageVC.viewModel.currentDate = pickerDate.date
//        currentPage.updateRow(pickerDate.date)
//    }
//
//    func updateCalendarCurrentDate() {
//        guard let calendarPageVC = self.children.first as? CalendarPageViewController else { return }
//
//        let direction: UIPageViewController.NavigationDirection = helperDate > pickerDate.date ?
//            .reverse : .forward
//
//        calendarPageVC.updateCalendarPage(from: helperDate,
//                                          to: pickerDate.date,
//                                          direction)
//        helperDate = pickerDate.date
//    }
//
//    func updatePickerCurrentDate(_ date: Date) {
//        pickerDate.setDate(date, animated: true)
//        helperDate = date
//    }
//    
//    func cancelPressed(_ alert: UIViewController) {
//    }
//
//    func donePressed(_ alert: UIViewController) {
//    }
//
//    @objc private func addPressed() {
//        let dateString = self.pickerDate.date.localizedDateString(dateFormat: Date.DateFormats.dayMonthYear.rawValue)!.firstCapitalized
//        let timeString = "10:00 - 17:00"
//        let attributedTimeString = NSMutableAttributedString (
//            string: timeString,
//            attributes: PopUpFontAttributes.addDataTime.value
//        )
//        let attributedDateString = NSMutableAttributedString (
//            string: dateString,
//            attributes: PopUpFontAttributes.addDataDate.value
//        )
//        let viewController = R.storyboard.popup.twoButtonAlert()!
//        let viewModel = MultipleButtonAlertViewController.ViewModel(
//            popupImage: R.image.credits_kopen()!,
//            firstDesctiption: attributedDateString,
//            secondDescription: attributedTimeString,
//            wantedBlurViewBackground: false,
//            leftButtonPressed: cancelPressed,
//            rightButtonPressed: donePressed,
//            numberOfButton: ButtonConfiguration.doubleButton(
//                firstButtonTitle: popUpfirstButtonTitle,
//                secondButtonTitle: NSAttributedString(string: R.string.localizable.done.key.localized.uppercased()),
//                firstButtonColor: .white,
//                secondButtonColor: .highlight))
//        viewController.viewModel = viewModel
//        self.present(viewController, animated: true, completion: nil)
//    }
//}
