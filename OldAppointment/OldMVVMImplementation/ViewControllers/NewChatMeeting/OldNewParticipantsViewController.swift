////
////  NewParticipantsViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 11/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class NewParticipantsViewController: NewChatBaseViewController, Storyboardable, IndicatorInfoProvider {
//    
//    static var storyboardName: String { return "NewChat" }
//    static var storyboardIdentifier: String { return "NewParticipantsViewController" }
//    
//    var isSearchBarHidden = false
//    
//    @IBOutlet private weak var searchBar: RoundedSearchBar! {
//        didSet {
//            guard !isSearchBarHidden else {
//                searchBar.isHidden = true
//                return
//            }
//            searchBar.placeholder = R.string.localizable.participant.key.localizedWithCount(count: 1).capitalizingFirstLetter()
//            searchBar.delegate = self
//        }
//    }
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.register(UINib(resource: R.nib.participantTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.participantTableViewCell.identifier)
//            tableView.separatorStyle = .none
//        }
//    }
//    
//    override func viewDidLoad() {
//        bindViewModel()
//        super.viewDidLoad()
//    }
//    
//    // MARK: - Private instance methods
//    private func bindViewModel() {
//        viewModel.didReceiveFriends = { [weak self] in
//            self?.tableView.reloadData()
//        }
//    }
//    
//    private func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchBar.text?.isEmpty ?? true
//    }
//    
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return IndicatorInfo(title: "absent".localized.uppercased())
//    }
//}
//
//extension NewParticipantsViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let filtered = viewModel.filteredFriends, !searchBarIsEmpty() {
//            return filtered.data.count
//        }
//        return viewModel.allFriends?.data.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.participantTableViewCell.identifier, for: indexPath) as? ParticipantTableViewCell else { return UITableViewCell() }
//        if let filtered = viewModel.filteredFriends, !searchBarIsEmpty() {
//            cell.configure(with: filtered.data[indexPath.row])
//        } else if let friends = viewModel.allFriends {
//            cell.configure(with: friends.data[indexPath.row])
//        } else {
//            return cell
//        }
//        cell.delegate = self
//        return cell
//    }
//}
//
//extension NewParticipantsViewController: ParticipantTableViewCellDelegate {
//    
//    func setChecked(_ isChecked: Bool, sender: ParticipantTableViewCell) {
//        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
//        if let filteredFriends = viewModel.filteredFriends, !searchBarIsEmpty() {
//            viewModel.updateSelectedFriends(shouldAdd: isChecked, friend: filteredFriends.data[tappedIndexPath.row])
//        } else if let friends = viewModel.allFriends {
//            viewModel.updateSelectedFriends(shouldAdd: isChecked, friend: friends.data[tappedIndexPath.row])
//        } else {
//            fatalError("Friends can not be empty")
//        }
//    }
//    
//    func crossButtonTapped(sender: ParticipantTableViewCell) {
//        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
//        print("Cross tapped at:", tappedIndexPath.row)
//    }
//}
//
//extension NewParticipantsViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        viewModel.searchFriends(query: searchText)
//    }
//}
