//
//  HomePageViewController.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/03/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol HomePageViewControllerProtocol: class, UIViewControllerRouting {
    func set(interactor: HomePageInteractorProtocol)
    func set(timelineStoryboard: Storyboard)

    func display(isMonthAgenda: Bool)
}

class HomePageViewController: UIPageViewController, HomePageViewControllerProtocol {

    // MARK: DI
    var interactor: HomePageInteractorProtocol?
    var timelineStoryboard: Storyboard?
    var isMonthAgenda: Bool?

    // set current year as initial yearIndex
    var year = Calendar(identifier: .gregorian).component(.year, from: Date())

    func set(interactor: HomePageInteractorProtocol) {
        self.interactor = interactor
    }

    func set(timelineStoryboard: Storyboard) {
        self.timelineStoryboard = timelineStoryboard
    }

    // MARK: Properties
    private lazy var initialViewController = {
        return self.newTimelineCalendarViewController(index: year)
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchSettings()
    }

    func display(isMonthAgenda: Bool) {
        configureViewControllers(isMonthAgenda: isMonthAgenda)
    }
}

// MARK: Configure Methods
private extension HomePageViewController {

    func configureViewControllers(isMonthAgenda: Bool) {
        dataSource = self
        delegate = self

        self.isMonthAgenda = isMonthAgenda

        isMonthAgenda
            ? setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
            : scrollToViewController(viewController: initialViewController)
    }

    func newTimelineCalendarViewController(index: Int) -> UIViewController {
        guard let vc = timelineStoryboard?.viewController(identifier: TimelineStoryboardId.timeline)
            as? TimelineViewController else { assertionFailure(); return UIViewController() }
        vc.set(yearIndex: index)
        return vc
    }

    func scrollToNextViewController() {
        guard
            let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) else { return }

        scrollToViewController(viewController: nextViewController)
    }

    /// Scrolls to the view controller at the given index. Automatically calculates the direction.
    func scrollToViewController(index newIndex: Int) {
        guard
            let firstViewController = viewControllers?.first as? TimelineViewController,
            let currentIndex = firstViewController.yearIndex else { return assertionFailure() }

        let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
        let nextViewController = newTimelineCalendarViewController(index: newIndex)
        scrollToViewController(viewController: nextViewController, direction: direction)
    }

    /// Scrolls to the given 'viewController' page.
    private func scrollToViewController(
        viewController: UIViewController,
        direction: UIPageViewController.NavigationDirection = .forward
    ) {
        setViewControllers([viewController], direction: direction, animated: true, completion: nil)
    }
}

// MARK: UIPageViewControllerDataSource
extension HomePageViewController: UIPageViewControllerDataSource {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {

        guard let isMonth = isMonthAgenda, !isMonth else { return nil }
        guard let vc = viewController as? TimelineViewController else { assertionFailure(); return nil }
        guard let viewControllerIndex = vc.yearIndex else { assertionFailure(); return nil }

        let previousIndex = viewControllerIndex - 1
        return newTimelineCalendarViewController(index: previousIndex)
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {

        guard let isMonth = isMonthAgenda, !isMonth else { return nil }
        guard let vc = viewController as? TimelineViewController else { assertionFailure(); return nil }
        guard let viewControllerIndex = vc.yearIndex else { assertionFailure(); return nil }

        let nextIndex = viewControllerIndex + 1
        return newTimelineCalendarViewController(index: nextIndex)
    }
}

extension HomePageViewController: UIPageViewControllerDelegate { }
