//
//  InvitationAddon.swift
//  appointment
//
//  Created by Irina Filkovskaya on 01.07.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

enum InvitationAddon {
    case todo([ToDo]?)
    case attachments([Attachment]?)
    case newChat
    case chatPrivate(String)
    case chatGroup(String)
    
    var title: String {
        switch self {
        case .todo:
            return R.string.localizable.todoList()
        case .attachments(let items):
            return R.string.localizable.attachments(items?.count ?? 0)
        case .newChat:
            return R.string.localizable.openNewChat()
        case .chatPrivate(let id):
            return id
        case .chatGroup(let id):
            return id
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .todo:
            return R.image.to_do_list()
        case .attachments:
            return R.image.invıtationItems.icn_bijlagen()
        case .newChat:
            return R.image.invıtationItems.new_chat()
        case .chatPrivate:
            return R.image.invıtationItems.icn_private_chat()
        case .chatGroup:
            return R.image.invıtationItems.icn_group_chat()
        }
    }
    
    var details: String {
        switch self {
        case .todo(let items):
            guard let items = items else { return "" }
            let done = items.filter { $0.done == true }
            return "\(done.count)/\(items.count)"
        case .attachments(let items):
            guard let items = items else { return "" }
            return "\(items.count) " + R.string.localizable.attachments(items.count)
        case .newChat:
            return ""
        case .chatPrivate:
            return ""
        case .chatGroup:
            return ""
        }
    }
}
