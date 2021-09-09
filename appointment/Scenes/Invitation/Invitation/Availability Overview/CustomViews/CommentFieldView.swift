//
//  CommentFieldView.swift
//  appointment
//
//  Created by Jihen on 06/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

@IBDesignable
class CommentFieldView: UIView, CustomViewProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "CommentFieldView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(for: "CommentFieldView")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
