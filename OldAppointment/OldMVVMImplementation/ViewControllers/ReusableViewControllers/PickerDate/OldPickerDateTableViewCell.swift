////
////  PickerDateTableViewCell.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 07/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//struct ScheduledEvent {
//    let date: String
//    let startTime: Int
//    let endTime: Int
//    let eventName: String
//    let color: UIColor
//}
//
//class PickerDateTableViewCell: UITableViewCell {
//
//    @IBOutlet private weak var timeLabel: UILabel!
//    @IBOutlet private weak var upperScheduledStack: UIStackView!
//    @IBOutlet private weak var lowerScheduledStack: UIStackView!
//
//    struct ViewModel {
//        let time: Int
//        let scheduledEvents: [ScheduledEvent]
//        
//        func isBetweenTime(startTime: Int, endTime: Int) -> Bool {
//            return time > startTime && time < endTime
//        }
//    }
//
//    var viewModel: ViewModel?
//
//    func configure() {
//
//        let timeString = viewModel!.time > 9 ?
//            String(viewModel!.time) : "0" + String(viewModel!.time)
//        timeLabel.text = timeString
//        prepareEventStackView()
//    }
//
//    func prepareEventStackView() {
//
//        upperScheduledStack.alignment = .fill
//        upperScheduledStack.distribution = .fillEqually
//
//        lowerScheduledStack.alignment = .fill
//        lowerScheduledStack.distribution = .fillEqually
//
//        upperScheduledStack.arrangedSubviews.forEach { view in
//            view.removeFromSuperview()
//        }
//
//        lowerScheduledStack.arrangedSubviews.forEach { view in
//            view.removeFromSuperview()
//        }
//
//        viewModel!.scheduledEvents.forEach { event in
//            let upperView = UIView()
//            let lowerView = UIView()
//            let endTime = event.endTime
//            let startTime = event.startTime
//            guard let viewModel = viewModel else { return }
//            if viewModel.isBetweenTime(startTime: startTime, endTime: endTime) {
//                upperView.backgroundColor = event.color
//                lowerView.backgroundColor = event.color
//            } else if viewModel.time == endTime {
//                upperView.backgroundColor = event.color
//            } else if viewModel.time == startTime {
//                lowerView.backgroundColor = event.color
//            }
//
//            lowerScheduledStack.addArrangedSubview(lowerView)
//            upperScheduledStack.addArrangedSubview(upperView)
//        }
//    }
//}
