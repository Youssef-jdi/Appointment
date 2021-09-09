////
////  PlanningView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//protocol PlanningViewDelegate: class {
//    func appointmentTouched(appointment model: PlanningAppointmentModel)
//}
//
//class OldPlanningView: UIView {
//    
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.font = R.font.robotoRegular(size: 16)
//            titleLabel.textColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var timeLabel: UILabel! {
//        didSet {
//            timeLabel.font = R.font.robotoRegular(size: 16)
//            timeLabel.textColor = R.color.appGray()
//        }
//    }
//    @IBOutlet private weak var typeImageView: UIImageView! {
//        didSet {
//            typeImageView.contentMode = .scaleAspectFit
//        }
//    }
//    @IBOutlet private weak var locationLabel: UILabel! {
//        didSet {
//            locationLabel.font = R.font.robotoRegular(size: 16)
//            locationLabel.textColor = R.color.appDimGray()
//        }
//    }
//    
//    @IBOutlet private weak var lineView: UIView! {
//        didSet {
//            lineView.layer.cornerRadius = lineView.frame.width / 2
//            lineView.clipsToBounds = true
//            lineView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
//        }
//    }
//    @IBOutlet private weak var cardView: UIView! {
//        didSet {
//            cardView.makeCardView()
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTouch))
//            cardView.addGestureRecognizer(tapGesture)
//        }
//    }
//    
//    var dataModel: PlanningAppointmentModel?
//    
//    weak var delegate: PlanningViewDelegate?
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
//    func prepareColorAndImage(color: UIColor, image: UIImage) {
//        lineView.backgroundColor = color
//        typeImageView.image = image
//    }
//    
//    private func commontInit() {
//        Bundle.main.loadNibNamed(R.nib.oldPlanningView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    func prepareView() {
//        guard let model = dataModel else { return }
//        titleLabel.text = model.title
//        timeLabel.text = model.date
//        locationLabel.text = model.place
//    }
//    
//    @objc private func viewTouch() {
//        delegate?.appointmentTouched(appointment: dataModel!)
//    }
//}
//
//extension OldPlanningView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        titleLabel.textColor = theme.firstColor
//    }
//}
