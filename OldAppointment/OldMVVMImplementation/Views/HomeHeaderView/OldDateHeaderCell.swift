////
////  DateHeaderCell.swift
////  appointment
////
////  Created by Dylan Barteling on 18/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//protocol DateHeaderDelegate: class {
//    func messageButtonPressed()
//    func addButtonPressed()
//    func previousMonthPressed()
//    func nextMonthPressed()
//}
//
//class DateHeaderCell: UITableViewHeaderFooterView {
//    
//    private var animator: UIViewPropertyAnimator!
//    
//    private var changedDate: Date? {
//        didSet {
//            guard let date = changedDate else { return }
//            lastMonthLabel.text = date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)
//        }
//    }
//    
//    @IBOutlet private weak var weekLabel: UILabel! {
//        didSet {
//            weekLabel.text = "week".localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var addButton: ButtonDoneRight!
//    @IBOutlet private weak var messageButton: ButtonDoneRight!
//    
//    @IBOutlet private weak var nextMonthButton: UIButton!
//    @IBOutlet private weak var previousMonthButton: UIButton!
//    @IBOutlet private weak var lastMonthLabel: UILabel!
//    
//    @IBOutlet private var dayLabels: [UILabel]! {
//        didSet {
//            dayLabels[0].text = "mondayShort".localized.uppercased()
//            dayLabels[1].text = "tuesdayShort".localized.uppercased()
//            dayLabels[2].text = "wednesdayShort".localized.uppercased()
//            dayLabels[3].text = "thursdayShort".localized.uppercased()
//            dayLabels[4].text = "fridayShort".localized.uppercased()
//            dayLabels[5].text = "saturdayShort".localized.uppercased()
//            dayLabels[6].text = "sundayShort".localized.uppercased()
//        }
//    }
//    
//    public weak var delegate: DateHeaderDelegate?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        initAnimation()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    @IBAction private func addButtonPressed(_ sender: UIButton) {
//        guard animator.fractionComplete < 0.5 else { return } // disable when button half gone
//        self.delegate?.addButtonPressed()
//    }
//    
//    @IBAction private func messageButtonPressed(_ sender: UIButton) {
//        guard animator.fractionComplete < 0.5 else { return } // disable when button half gone
//        self.delegate?.messageButtonPressed()
//    }
//    
//    @IBAction private func previousMonthPressed(_ sender: UIButton) {
//        touchPressed()
//        self.delegate?.previousMonthPressed()
//    }
//    
//    @IBAction private func nextMonthPressed(_ sender: UIButton) {
//        touchPressed()
//        self.delegate?.nextMonthPressed()
//    }
//    
//    private func touchPressed() {
//        let generator = UISelectionFeedbackGenerator()
//        generator.selectionChanged()
//    }
//    
//    func changeDate(date: Date) {
//        changedDate = date
//    }
//    
//    func fadeButtons(progress: CGFloat) {
//        let newProgress = max(progress, 0.001)
//        animator.fractionComplete = newProgress
//        animator.pauseAnimation()
//    }
//    
//    func stopAnimation() {
//        guard animator.state == .active else { return }
//        animator.stopAnimation(true)
//        animator.finishAnimation(at: .end)
//    }
//    
//    func initAnimation() {
//        animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: {
//            var transform = CGAffineTransform.identity
//            transform = transform.translatedBy(x: 0, y: 120)
//            transform = transform.scaledBy(x: 0.5, y: 0.5)
//            
//            self.messageButton.transform = transform
//            self.addButton.transform = transform
//        })
//        animator.addAnimations({
//            var transform = CGAffineTransform.identity
//            transform = transform.translatedBy(x: 0, y: -20)
//            transform = transform.scaledBy(x: 0.5, y: 0.5)
//            
//            self.messageButton.transform = transform
//            self.addButton.transform = transform
//        }, delayFactor: 1 / 2)
//        animator.isUserInteractionEnabled = true
//        animator.pausesOnCompletion = true
//    }
//}
//
//extension DateHeaderCell: Themeable {
//    
//    func applyTheme(theme: ProductModel) {
//        nextMonthButton.tintColor = theme.highlightColor!
//        previousMonthButton.tintColor = theme.highlightColor!
//        weekLabel.textColor = theme.highlightColor!
//        addButton.fillColor = theme.highlightColor!
//    }
//}
