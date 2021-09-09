////
////  NewChatMeetingViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 11/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class NewChatMeetingViewController: NewChatBaseViewController, Storyboardable, IndicatorInfoProvider {
//    
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return IndicatorInfo(title: R.string.localizable.participant.key
//            .localizedWithCount(count: 2)
//            .uppercased()
//        )
//    }
//    
//    static var storyboardName: String { return "NewChat" }
//    static var storyboardIdentifier: String { return "NewChatMeetingViewController" }
//    
//    var isSubjectViewHidden = false
//    
//    @IBOutlet private weak var subjectView: UIView! {
//        didSet {
//            subjectView.isHidden = isSubjectViewHidden
//        }
//    }
//    @IBOutlet private weak var subjectTextField: RoundedTextField! {
//        didSet {
//            subjectTextField.placeholder = R.string.localizable.subject().capitalizingFirstLetter()
//            subjectTextField.layer.cornerRadius = 10
//            subjectTextField.clipsToBounds = true
//            subjectTextField.backgroundColor = .white
////            subjectTextField.font = R.font.openSans(size: 16)!
//        }
//    }
//    
//    @IBOutlet private weak var addParticipantButton: UIButton! {
//        didSet {
//            addParticipantButton.setImage(R.image.add_Icon_White()!, for: .normal)
//            addParticipantButton.setTitle(R.string.localizable.addParticipant().uppercased(), for: .normal)
//            addParticipantButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
//            addParticipantButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
//        }
//    }
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.register(R.nib.participantTableViewCell)
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.separatorStyle = .none
//        }
//    }
//    
//    override func viewDidLoad() {
//        bindViewModel()
//        super.viewDidLoad()
//        addBackButton()
//    }
//    
//    private func bindViewModel() {
////        viewModel.didReceiveFriends = { [weak self] in
////            self?.tableView.reloadData()
////        }
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
//            addParticipantButton.transform == .identity else { return }
//        addParticipantButton.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height)
//    }
//    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        guard addParticipantButton.transform != .identity else { return }
//        addParticipantButton.transform = .identity
//    }
//    
//    override func applyTheme(theme: ProductModel) {
//        super.applyTheme(theme: theme)
//        subjectView.backgroundColor = theme.backgroundColor
//        addParticipantButton.backgroundColor = theme.highlightColor
//    }
//}
//
//extension NewChatMeetingViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 45
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return R.string.localizable.participant().capitalizingFirstLetter()
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.selectedFriends.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.participantTableViewCell, for: indexPath)!
//        cell.configure(with: viewModel.selectedFriends[indexPath.row], cellType: .delete)
//        cell.delegate = self
//        return cell
//    }
//}
//
//extension NewChatMeetingViewController: ParticipantTableViewCellDelegate {
//    
//    func setChecked(_ isChecked: Bool, sender: ParticipantTableViewCell) { }
//    
//    func crossButtonTapped(sender: ParticipantTableViewCell) {
//        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
//        self.viewModel.removeSelectedFriend(index: tappedIndexPath.row)
//        self.tableView.deleteRows(at: [tappedIndexPath], with: .automatic)
//    }
//}
