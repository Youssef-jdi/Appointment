//
//  ProposedDatesView.swift
//  appointment
//
//  Created by Jihen on 25/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol TopDialogueViewDelegate: class {
    func confirmButtonTapped(at sender: TopDialogueType?)
    func cancelButtonTapped(at sender: TopDialogueType?)
}

@IBDesignable
class TopDialogueView: UIView, CustomViewProtocol {
    private var type: TopDialogueType?

    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    weak var delegate: TopDialogueViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "TopDialogueView")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "TopDialogueView")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        delegate?.cancelButtonTapped(at: self.type)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        delegate?.confirmButtonTapped(at: self.type)
    }
}

extension TopDialogueView {
    // TODO: Switch to the second configure method once the proposedDate type is implemented
    func configure(
        title: String,
        description: String,
        cancelButtonTitle: String,
        addButtonTitle: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        confirmButton.setTitle(addButtonTitle, for: .normal)
    }
    
    func configure(for type: TopDialogueType) {
        self.type = type
        imageView.image = type.icon
        titleLabel.text = type.title
        descriptionLabel.text = type.description
        cancelButton.setTitle(type.cancelButtonTitle, for: .normal)
        confirmButton.setTitle(type.confirmButtonTitle, for: .normal)
    }
}

// TODO: Localize
enum TopDialogueType {
    case newProposedDate(String)
    case finalDateSetOutgoing(String)
    case finalDateSetIncoming(String, Bool, String)
    
    var title: String {
        switch self {
        case .newProposedDate(let date):
            return "Er is een nieuwe datum voorgesteld door job Nijdam in Party op: \(date)."
        case .finalDateSetOutgoing(let invitationTitle):
            return "De geprikte datum van de \(invitationTitle) staat nog niet in je agenda."
        case .finalDateSetIncoming(let date, let isConflicted, _):
           return isConflicted ? "Er is een datum geprikt op:\n \(date)\n Je hebt dan een dubbele afspraak (zakelijk)" : "Er is een datum geprikt op:\n \(date)"
        }
    }
    
    var description: String {
        switch self {
        case .newProposedDate:
            return "Deze datum toevoegen aan beschikbare data in de groepsgesprek?"
        case .finalDateSetOutgoing:
            return "Wil je deze uitnodiging toevoegen?"
        case .finalDateSetIncoming(_, _, let appointmentTitle):
            return "\(appointmentTitle) toevoegen aan je agenda?"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .newProposedDate:
            return R.image.popUp_dateSugesstion_outgoing()
        case .finalDateSetOutgoing:
            return R.image.popUp_dateConfirmation()
        case .finalDateSetIncoming(_, let isConflicted, _):
            return isConflicted ? R.image.popUp_Icon() : R.image.popUp_dateConfirmation()
        }
    }
    
    var cancelButtonTitle: String {
        switch self {
        case .newProposedDate, .finalDateSetIncoming:
            return "NIET TOEVOEGEN"
        case .finalDateSetOutgoing:
            return R.string.localizable.cancel().uppercased()
        }
    }
    
    var confirmButtonTitle: String {
        switch self {
        case .newProposedDate, .finalDateSetIncoming:
            return "TOEVOEGEN"
        case .finalDateSetOutgoing:
            return "toevoegen aan agenda".uppercased()
        }
    }
}
