//
//  InvitationAddonView.swift
//  appointment
//
//  Created by Irina Filkovskaya on 01.07.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol InvitationAddonViewDelegate {
    func handleTap(sender: InvitationAddon?)
}

class InvitationAddonView: UIView, CustomViewProtocol {
    private var data: InvitationAddon?
    private var delegate: InvitationAddonViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "InvitationAddonView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "InvitationAddonView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(delegate: InvitationAddonViewDelegate) {
        self.delegate = delegate
    }
    
    func configure(for data: InvitationAddon) {
        self.data = data
        imageView.image = data.icon
        titleLabel.text = data.title
        detailLabel.text = data.details
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tap)
    }
    
    func fetch() -> InvitationAddon? {
        return self.data
    }
    
    @objc func handleTap() {
        print("😈 testHandleTap")
        delegate?.handleTap(sender: data)
    }
}
