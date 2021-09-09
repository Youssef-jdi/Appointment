////
////  DiagramCircleView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class OldDiagramCircleView: UIView {
//    
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private weak var roundedContainer: UIView!
//    @IBOutlet private weak var profilePhotoImageView: RoundedImageView! {
//        didSet {
//            profilePhotoImageView.color = .white
//            profilePhotoImageView.image = R.image.profilePicture_icon()!
//        }
//    }
//    @IBOutlet private weak var nameLabel: UILabel!
//    @IBOutlet private weak var statusImageView: UIImageView!
//    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commontInit()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commontInit()
//    }
//    
//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//        prepareContentView()
//        prepareProfilePhotoConstraint()
//    }
//    
//    private func commontInit() {
//        Bundle.main.loadNibNamed(R.nib.diagramCircleView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.isUserInteractionEnabled = true
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    func prepareView(profileImage: UIImage?, fullName: String, state: AttendancesType, stateImage: UIImage?) {
//        profilePhotoImageView.image = profileImage
//        nameLabel.text = fullName
//        if case .cancelled = state { contentView.alpha = 0.1 }
//        statusImageView.image = stateImage
//    }
//    
//    private func prepareContentView() {
//        roundedContainer.layer.cornerRadius = roundedContainer.frame.height / 2
//        roundedContainer.layer.borderWidth = 2
//        roundedContainer.layer.borderColor = UIColor.white.cgColor
//        roundedContainer.backgroundColor = ThemeService.shared.theme.firstColor
//    }
//    
//    private func prepareProfilePhotoConstraint() {
//        imageViewTopConstraint.constant = -profilePhotoImageView.frame.height / 2
//    }
//}
//
//extension OldDiagramCircleView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        roundedContainer.backgroundColor = theme.firstColor
//    }
//}
