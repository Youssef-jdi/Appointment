////
////  CalendarViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 07/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class CalendarPageViewController: UIPageViewController {
//
//    struct ViewModel {
//        var currentDate: Date
//    }
//
//    var viewModel: ViewModel!
//    var scheduledEvents = [
//        ScheduledEvent(date: "2019-03-08",
//                       startTime: 8,
//                       endTime: 12,
//                       eventName: "PippeTime!",
//                       color: .yellow),
//        
//        ScheduledEvent(date: "2019-03-10",
//                       startTime: 13,
//                       endTime: 16,
//                       eventName: "AnotherPippeTime!",
//                       color: .purple),
//        
//        ScheduledEvent(date: "2019-03-06",
//                       startTime: 10,
//                       endTime: 16,
//                       eventName: "YourGoingToBeBlindMan",
//                       color: .red),
//        
//        ScheduledEvent(date: "2019-03-08",
//                       startTime: 3,
//                       endTime: 16,
//                       eventName: "PippeTime!",
//                       color: .blue),
//        ScheduledEvent(date: "2019-03-10",
//                       startTime: 16,
//                       endTime: 23,
//                       eventName: "AnotherPippeTime!",
//                       color: .green),
//        ScheduledEvent(date: "2019-03-06",
//                       startTime: 10,
//                       endTime: 15,
//                       eventName: "YourGoingToBeBlindMan",
//                       color: .orange)
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        dataSource = self
//        delegate = self
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let currentVC = CalendarTableViewController.instantiate()
//        let firstVC = prepareCalendarTableVC(currentVC, viewModel.currentDate)
//        setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
//    }
//
//    func updatePickerVC() {
//        guard let pickerVC = self.parent as? PickerDateViewController else { return }
//        pickerVC.updatePickerCurrentDate(viewModel.currentDate)
//    }
//
//    func updateCalendarPage(from startDate: Date, to endDate: Date ,_ direction: UIPageViewController.NavigationDirection) {
//
//        guard var currentViewController = self.viewControllers?.first as? CalendarTableViewController else { return }
//        var start = currentViewController.viewModel!.calendarDate
//        let end = endDate.addingTimeInterval(TimeInterval(exactly: 300)!)
//        viewModel.currentDate = start
//
//        switch direction {
//        case .forward:
//            while start < endDate {
//                currentViewController = configureVC(.forward)
//                start = currentViewController.viewModel!.calendarDate
//                setCalendarVC(currentViewController, direction)
//            }
//
//        case .reverse:
//            while start > end {
//                currentViewController = configureVC(.reverse)
//                start = currentViewController.viewModel!.calendarDate
//                setCalendarVC(currentViewController, direction)
//            }
//        }
//    }
//
//    func setCalendarVC(_ currentViewController: CalendarTableViewController, _ direction: UIPageViewController.NavigationDirection) {
//        viewModel.currentDate = currentViewController.viewModel!.calendarDate
//        setViewControllers([currentViewController], direction: direction, animated: true, completion: nil)
//        viewModel.currentDate = currentViewController.viewModel!.calendarDate
//    }
//
//    func configureVC(_ direction: UIPageViewController.NavigationDirection) -> CalendarTableViewController {
//        let int = direction == .forward ?
//            86_400 : -86_400
//
//        let vc = CalendarTableViewController.instantiate()
//
//        let date = viewModel.currentDate.addingTimeInterval(TimeInterval(exactly: int)!)
//        return prepareCalendarTableVC(vc, date)
//    }
//
//    func prepareCalendarTableVC(_ vc: CalendarTableViewController,_ data: Date) -> CalendarTableViewController {
//        let filteredEvent = filterEvent(date: data.description)
//        vc.viewModel = CalendarTableViewController.ViewModel(calendarDate: data,
//                                                             scheduledEvents: filteredEvent)
//        return vc
//    }
//
//    func filterEvent(date: String) -> [ScheduledEvent] {
//        return scheduledEvents.filter { date.description.contains($0.date) }
//    }
//}
//
//extension CalendarPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        return configureVC(.reverse)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return configureVC(.forward)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if completed {
//            pageViewControllerReloadData()
//        }
//    }
//
//    func pageViewControllerReloadData() {
//
//        guard let vc = viewControllers?[0] as? CalendarTableViewController,
//            let displayedDate = vc.viewModel?.calendarDate else { return }
//
//        viewModel.currentDate = displayedDate
//        updatePickerVC()
//    }
//}
