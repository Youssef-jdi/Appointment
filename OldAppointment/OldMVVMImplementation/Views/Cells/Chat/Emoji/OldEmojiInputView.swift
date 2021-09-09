////
////  EmojiInputView.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class EmojiInputView: UIView {
//    
//    var emojiDelegate: EmojiDelegate?
//    
//    private let itemsPerRow: CGFloat = 6
//    
//    var emojiModel: EmojiModel! {
//        didSet {
//            tableView.reloadData()
//        }
//    }
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: "EmojiTableViewCell")
//        }
//    }
//}
//
//extension EmojiInputView: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return emojiModel.data.categories[section].name
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiTableViewCell", for: indexPath) as? EmojiTableViewCell else { return UITableViewCell() }
//        let emoji = emojiModel.data.categories[indexPath.section].emojis
//        cell.configure(with: emoji)
//        cell.emojiDelegate = self
//        return cell
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return emojiModel.data.categories.count
//    }
//}
//
//extension EmojiInputView: EmojiDelegate {
//    func emojiTapped(_ emojiCode: String) {
//        emojiDelegate?.emojiTapped(emojiCode)
//    }
//}
