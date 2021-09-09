////
////  ChatParentViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 20/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//enum ChatType: Int, Codable {
//    case memoTo
//    case group
//    case MOM
//    
//    var title: String {
//        switch self {
//        case .memoTo:
//            return "memoTo".localized.capitalizingFirstLetter()
//        case .group:
//            return "group".localized.capitalizingFirstLetter()
//        case .MOM:
//            return "meeting".localized.capitalizingFirstLetter()
//        }
//    }
//    
//    var image: UIImage {
//        switch self {
//        case .memoTo:
//            return R.image.memoTo_header_white_icon()!
//        case .group:
//            return R.image.memo_header_white_icon()!
//        case .MOM:
//            return R.image.mom_header_white_icon()!
//        }
//    }
//}
//
//class ChatParentViewController: BaseViewController, Storyboardable {
//    
//    static var storyboardName: String { return "Chat" }
//    static var storyboardIdentifier: String { return "ChatParentViewController" }
//    
//    @IBOutlet private weak var chatContainerView: UIView!
//    @IBOutlet private weak var headerView: UIView!
//    @IBOutlet private weak var headerImageView: UIImageView!
//    @IBOutlet private weak var subtitleLabel: UILabel! {
//        didSet {
//            subtitleLabel.font = R.font.openSansBold(size: 12)
//            subtitleLabel.textColor = .white
//        }
//    }
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.font = R.font.notoSans(size: 18)
//            titleLabel.textColor = .white
//        }
//    }
//    
//    private var sender: UserModel {
//        return SampleData.shared.currentSender
//    }
//    
//    var chatType: ChatType = .MOM
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        ThemeService.shared.addThemeable(themable: self)
//        
//        setupHeader()
//        setupNavBarItems()
//        setupChildViewController()
//    }
//    
//    private func setupHeader() {
//        titleLabel.text = String(format: "%1$@ %2$@", chatType.title, sender.data.givenName)
//        subtitleLabel.text = chatType.title
//        headerImageView.image = chatType.image
//    }
//    
//    private func setupNavBarItems() {
//        var items: [UIBarButtonItem] = []
//        switch chatType {
//        case .memoTo:
//            // Calendar
//            // Notification
//            // Cross/Delete
//            break
//        case .group:
//            // Pin (only if admin) -> select date
//            // Person -> Participants
//            break
//        case .MOM:
//            let state = MemoState.normal
//            let left: UIBarButtonItem
//            if state == .normal {
//                // TODO: Lock Image
//                left = UIBarButtonItem(image: R.image.cross()!, target: self, action: #selector(calendarTapped))
//            } else {
//                // TODO: Download Image
//                left = UIBarButtonItem(image: R.image.cross()!, target: self, action: #selector(calendarTapped))
//            }
//            // TODO: Notification Image
//            let notification = UIBarButtonItem(image: R.image.cross()!, target: self, action: #selector(calendarTapped))
//            
//            // Cross/Delete
//            let cross = UIBarButtonItem(image: R.image.cross()!, target: self, action: #selector(calendarTapped))
//            items = [left, notification, cross]
//        }
//        navigationItem.rightBarButtonItems = items
//    }
//    
//    private func setupChildViewController() {
//        if case .MOM = chatType {
//            let chatViewController = R.storyboard.chat.meetingTabViewController()!
//            chatViewController.chatType = chatType
//            addViewController(chatViewController)
//        } else {
//            let chatViewController = R.storyboard.chat.chatViewController(())!
//            chatViewController.chatType = chatType
//            addViewController(chatViewController)
//        }
//    }
//    
//    private func addViewController(_ vc: UIViewController) {
//        addChild(vc)
//        
//        vc.view.frame = chatContainerView.bounds
//        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        vc.didMove(toParent: self)
//        chatContainerView.addSubview(vc.view)
//    }
//    
//    override func applyTheme(theme: ProductModel) {
//        super.applyTheme(theme: theme)
//        headerView.backgroundColor = theme.backgroundColor
//    }
//}
//
//extension ChatParentViewController {
//    
//    @objc func calendarTapped() {
//        // TODO: - Go to calendar
//    }
//}
