////
////  HomeViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 1.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SideMenuSwift
//
//class HomeViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Home" }
//    static var storyboardIdentifier: String { return "HomeViewController" }
//    
//    typealias ViewModel = EventViewModel
//    
//    var viewModel = EventViewModel()
//    
//    private var homeTitleView: HomeTitleView {
//        let view = HomeTitleView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        view.delegate = self
//        return view
//    }
//    
//    private lazy var timelineView: TimelineMenu = {
//        var view = TimelineMenu()
//        view.frame = CGRect(x: self.view.frame.maxX - 166, y: view.frame.height * 0.15, width: 150, height: 300)
//        view.delegate = self
//        view.alpha = 0
//        view.layer.shadowRadius = 4
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = .zero
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationItem.titleView = homeTitleView
//        self.addSideMenuButton()
//        self.addTimelineView()
//        let timeLineviewController = R.storyboard.timeline.planningTimelineViewController()!
//        addViewController(timeLineviewController)
//    }
//    
//    private func addViewController(_ vc: UIViewController) {
//        children.forEach { removeChildViewController($0) }
//        addChild(vc)
//        
//        vc.view.frame = view.bounds
//        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        vc.didMove(toParent: self)
//        view.insertSubview(vc.view, at: 0)
//    }
//    
//    func removeChildViewController(_ vc: UIViewController) {
//        vc.willMove(toParent: nil)
//        vc.view.removeFromSuperview()
//        vc.removeFromParent()
//    }
//    
//    func addTimelineView() {
//        let timelineButton = UIBarButtonItem(image: R.image.landing_Dots()!, style: .plain, target: self, action: #selector(timelineMenuButtonPressed))
//        navigationItem.rightBarButtonItem = timelineButton
//        navigationItem.rightBarButtonItem?.tintColor = .white
//        view.addSubview(timelineView)
//    }
//    
//    func createMemoToCellPressed(_ alert: UIViewController, _ index: Int) {
//        var viewController: NewChatMeetingViewController?
//        switch index {
//        case 0:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .group
//        case 1:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .memoTo
//        case 2:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .MOM
//        case 3: break
//        default: break
//        }
//        
//        guard let vc = viewController else { return }
//        alert.dismiss(animated: true) {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//}
//
//extension HomeViewController: HomeTitleViewDelegate {
//    func didEndEditing(with year: Int) {
//        viewModel.changeYear(with: year)
//    }
//}
//
//extension HomeViewController: TimelineDelegate {
//    func timelinePressed() {
//        let viewController = R.storyboard.timeline.planningTimelineViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    func yearPressed() {
//        let viewController = R.storyboard.timeline.planningYearViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    func monthPressed() {
//        let viewController = R.storyboard.timeline.planningTimelineViewController()!
//        // let viewController = R.storyboard.timeline.planningMonthViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    func dayPressed() {
//        let viewController = R.storyboard.timeline.planningTimelineViewController()!
//        // let viewController = R.storyboard.timeline.planningDayViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    func planningPressed() {
//        let viewController = R.storyboard.timeline.planningViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    func searchPressed() {
//        let viewController = R.storyboard.timeline.planningSearchViewController()!
//        addViewController(viewController)
//        timelineMenuButtonPressed()
//    }
//    
//    @objc func timelineMenuButtonPressed() {
//        let value: CGFloat = self.timelineView.alpha == 0 ? 1 : 0
//        UIView.animate(withDuration: 0.3) {
//            self.timelineView.alpha = value
//        }
//    }
//}
