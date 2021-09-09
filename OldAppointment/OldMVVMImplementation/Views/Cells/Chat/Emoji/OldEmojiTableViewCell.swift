////
////  EmojiTableViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Nuke
//
//protocol EmojiDelegate: class {
//    func emojiTapped(_ emojiCode: String)
//}
//
//class EmojiTableViewCell: UITableViewCell {
//    
//    weak var emojiDelegate: EmojiDelegate?
//    
//    private let itemCount: CGFloat = 6
//    private var emojis: [EmojiModel.Datum.Emoji] = [] {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//    
//    private lazy var layout: UICollectionViewFlowLayout = {
//        let padding: CGFloat = 5
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
//        layout.minimumLineSpacing = padding
//        layout.minimumInteritemSpacing = padding
//        let horizontalPadding = (layout.minimumInteritemSpacing * (itemCount - 1))
//        let sectionPadding = layout.sectionInset.left + layout.sectionInset.right
//        let itemSize = ((frame.width - sectionPadding) / itemCount)
//        layout.itemSize = CGSize(width: itemSize, height: itemSize)
//        return layout
//    }()
//    
//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(EmojiCollectionViewCell.self, forCellWithReuseIdentifier: "EmojiCollectionViewCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.isScrollEnabled = false
//        return collectionView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//            ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        return self.collectionView.collectionViewLayout.collectionViewContentSize
//    }
//    
//    func configure(with emojis: [EmojiModel.Datum.Emoji]) {
//        self.emojis = emojis
//    }
//}
//
//extension EmojiTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return emojis.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCollectionViewCell", for: indexPath) as? EmojiCollectionViewCell else { return UICollectionViewCell() }
//        cell.configure(with: emojis[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        emojiDelegate?.emojiTapped(emojis[indexPath.row].code)
//    }
//}
