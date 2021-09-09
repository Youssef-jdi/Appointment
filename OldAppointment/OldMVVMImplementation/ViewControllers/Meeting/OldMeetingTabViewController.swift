////
////  MeetingTabViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 20/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class MeetingTabViewController: ButtonBarPagerTabStripViewController {
//    
//    //    typealias ViewModel = MeetingViewModel
//    //    var viewModel = ViewModel()
//    
//    var chatType: ChatType!
//    
//    override func viewDidLoad() {
//        ThemeService.shared.addThemeable(themable: self)
//        configureTopBar()
//        super.viewDidLoad()
//    }
//    
//    func configureTopBar() {
//        settings.style.selectedBarBackgroundColor = .white
//        settings.style.selectedBarHeight = 2.0
//        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
//        settings.style.buttonBarItemTitleColor = .white
//        settings.style.buttonBarMinimumLineSpacing = 5
//        settings.style.buttonBarMinimumInteritemSpacing = 0
//        
//        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//            
//            newCell?.label.font = UIFont.boldSystemFont(ofSize: 16)
//            oldCell?.label.font = UIFont.systemFont(ofSize: 16)
//        }
//    }
//    
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        
//        guard
//            let chatViewController = R.storyboard.chat.chatViewController(),
//            let newChatViewController = R.storyboard.newChat.newChatMeetingViewController(),
//            let participantViewController = R.storyboard.newChat.newParticipantsViewController()
//            else { return [] }
//        
//        newChatViewController.isSubjectViewHidden = true
//        participantViewController.isSearchBarHidden = true
//        chatViewController.chatType = chatType
//        newChatViewController.newType = chatType
//        participantViewController.newType = chatType
//        
//        return [chatViewController, newChatViewController, participantViewController]
//    }
//}
//
//extension MeetingTabViewController: Themeable {
//    func applyTheme(theme: ProductModel) {
//        settings.style.buttonBarBackgroundColor = theme.backgroundColor
//        settings.style.buttonBarItemBackgroundColor = theme.backgroundColor
//    }
//}
