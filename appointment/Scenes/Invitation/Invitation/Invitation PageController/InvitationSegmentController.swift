//
//  InvitationSegmentController.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

enum InvitationSegmentItem {
    case outgoing
    case incoming

    var identifier: String {
        switch self {
        case .outgoing:
            return R.string.localizable.outgoing()

        case .incoming:
            return R.string.localizable.incoming()
        }
    }

    var index: Int {
        switch self {
        case .outgoing: return 0
        case .incoming: return 1
        }
    }

    var previosItem: InvitationSegmentItem? {
        switch self {
        case .outgoing: return nil
        case .incoming: return .outgoing
        }
    }

    var nextItem: InvitationSegmentItem? {
        switch self {
        case .outgoing: return .incoming
        case .incoming: return nil
        }
    }
}
