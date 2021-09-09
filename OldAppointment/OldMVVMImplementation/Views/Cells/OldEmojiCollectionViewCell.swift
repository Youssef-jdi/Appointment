////
////  EmojiCollectionViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 08/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Nuke
//
//class OldEmojiCollectionViewCell: UICollectionViewCell {
//    
//    private var code: String!
//    
//    private lazy var imageView: UIImageView = {
//        let imageView = UIImageView(frame: bounds)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = .white
//        
//        addSubview(imageView)
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: self.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
//            ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with emoji: EmojiModel.Datum.Emoji) {
//        self.code = emoji.code
//        guard let url = URL(string: emoji.url) else { return }
//        Nuke.loadImage(with: url, into: imageView)
//    }
//}
