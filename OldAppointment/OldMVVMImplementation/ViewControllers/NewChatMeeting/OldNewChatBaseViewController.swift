////
////  NewChatBaseViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 15/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class NewChatBaseViewController: BaseViewController, MVVMViewController {
//    
//    typealias ViewModel = NewChatViewModel
//    
//    let viewModel = ViewModel()
//    var newType: ChatType!
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.prefersLargeTitles = false
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = String.localizedStringWithFormat("newChat".localized, newType.title).capitalizeWords()
//        navigationController?.navigationBar.tintColor = R.color.appLightGray()!
//        navigationController?.edgesForExtendedLayout = []
//        extendedLayoutIncludesOpaqueBars = true
//        addRightButton()
//        viewModel.getFriends()
//    }
//    
//    private func addRightButton() {
//        let saveButton = UIBarButtonItem(title: R.string.localizable.save.key.localized.uppercased(), style: .plain, target: self, action: #selector(saveButtonPressed))
//        navigationItem.rightBarButtonItem = saveButton
//    }
//    
//    @objc func saveButtonPressed() {
//        let chatParentViewController = R.storyboard.chat.chatParentViewController()!
//        chatParentViewController.chatType = newType
//        navigationController?.pushViewController(chatParentViewController, animated: true)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == NewParticipantsViewController.storyboardIdentifier {
//            guard let vc = segue.destination as? NewParticipantsViewController else { return }
//            vc.newType = newType
//        }
//    }
//}
