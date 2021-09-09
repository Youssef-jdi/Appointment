//
//  InvitationTabView.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationTabView: UIView {

    enum State: Equatable {
        case outGoing
        case inComing
        mutating func toggle() {
            self = self == .outGoing ? State.inComing : State.outGoing
        }
    }

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var toggleView: UIView!
    @IBOutlet weak var outGoingLabel: UILabel!
    @IBOutlet weak var bottomBorderView: UIView! {
        didSet {
            bottomBorderView.layer.applyShadow(offset: .init(width: 0, height: 5), radius: 10, opacity: 0.15, color: .black)
        }
    }
    @IBOutlet weak var inComingLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "InvitationTabView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "InvitationTabView")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLocalization()
    }

    func toggle(state: State, animated: Bool) {
        if animated {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 5,
                animations: {
                    self.setupToggle(state: state)
            })
        } else {
            self.setupToggle(state: state)
        }
    }

    private func setupToggle(state: State) {
        bottomBorderView.transform = state == .outGoing ? .identity : CGAffineTransform(translationX: self.contentView.frame.width / 2, y: 0)
    }

    func setupLocalization() {
        outGoingLabel.text = "OutGoing"
        inComingLabel.text = "InComing"
    }
}

extension InvitationTabView: CustomViewProtocol {}
