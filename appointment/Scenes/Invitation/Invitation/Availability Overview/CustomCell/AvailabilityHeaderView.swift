//
//  AvailabilityHeaderView.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class AvailabilityHeaderView: UIView, CustomViewProtocol {

    // MARK: - Cell State
    enum States {
        case available, maybe, unavailable, unknown

        var icon: UIImage? {
            switch self {
            case .available:
//                return #imageLiteral(resourceName: "Checked").withRenderingMode(.alwaysOriginal)
                return R.image.invıtationItems.icn_check()
            case .maybe:
//                return #imageLiteral(resourceName: "icn_question").withRenderingMode(.alwaysOriginal)
                return R.image.invıtationItems.icn_question()
            case .unavailable:
//                return #imageLiteral(resourceName: "icn_cross").withRenderingMode(.alwaysOriginal)
                return R.image.invıtationItems.icn_cross()
            case .unknown:
//                return #imageLiteral(resourceName: "icn_dots").withRenderingMode(.alwaysOriginal)
                return R.image.invıtationItems.icn_dots()
            }
        }

        var title: String {
            switch self {
            case .available:
				return R.string.localizable.availableTitle()
            case .maybe:
                return R.string.localizable.maybeTitle()
            case .unavailable:
                return R.string.localizable.unavailableTitle()
            case .unknown:
                return R.string.localizable.unknownTitle()
            }
        }
    }

    // MARK: - Outlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "AvailabilityHeaderView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "AvailabilityHeaderView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(viewModel: HeaderViewModel) {
        iconImageView.image = viewModel.state.icon
        titleLabel.text = viewModel.state.title
        countLabel.text = "(\(viewModel.count))"
    }
}

struct HeaderViewModel: Equatable {
    let state: AvailabilityHeaderView.States
    let count: Int
}
