//
//  CustomSegementedControl.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate: class {
    func segmentedControl(_ control: CustomSegmentedControl, didScrollTo point: CGFloat)
}

@IBDesignable class CustomSegmentedControl: UIControl {

    private var labels = [UILabel]()
    var thumbView = UIView()

    weak var delegate: CustomSegmentedControlDelegate?

    var items: [String] = ["Item 1", "Item 2", "Item 3"] {
        didSet {
            setupLabels()
        }
    }

    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }

    @IBInspectable var selectedLabelColor: UIColor = .white {
        didSet {
            setSelectedColors()
        }
    }

    @IBInspectable var unselectedLabelColor: UIColor = .white {
        didSet {
            setSelectedColors()
        }
    }

    @IBInspectable var thumbColor: UIColor = R.color.appDimGray()! {
        didSet {
            setSelectedColors()
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var font: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            setFont()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        var selectFrame = self.bounds
        let newWidth = selectFrame.width / CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbView.backgroundColor = thumbColor
        thumbView.layer.cornerRadius = thumbView.frame.height / 2

        displayNewSelectedIndex()
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

        let location = touch.location(in: self)

        var calculatedIndex: Int?

        labels.enumerated().forEach { index, item in
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }

        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }

        return false
    }

    func scroll(to point: CGFloat) {
        let middlePoint = frame.midX

        if middlePoint < frame.width || middlePoint > frame.midX {
            self.thumbView.transform = CGAffineTransform(translationX: point, y: 0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        layer.borderWidth = 2

        setupLabels()

        addIndividualItemConstraints(items: labels, mainView: self, padding: 0)

        insertSubview(thumbView, at: 0)
    }

    private func setupLabels() {

        for label in labels {
            label.removeFromSuperview()
        }

        labels.removeAll(keepingCapacity: true)

        items.indices.forEach { index in
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
            label.text = items[index]
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.font = R.font.notoSans(size: 15)
            label.textColor = index == 1 ? selectedLabelColor : unselectedLabelColor
            label.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label)
            labels.append(label)
        }

        addIndividualItemConstraints(items: labels, mainView: self, padding: 0)
    }

    private func displayNewSelectedIndex() {

        labels.enumerated().forEach { _, item in
            item.textColor = unselectedLabelColor
        }

        let label = labels[selectedIndex]
        label.textColor = selectedLabelColor

        UIView.animate(withDuration: 0.2) {
            self.thumbView.frame = label.frame
        }
    }

    //swiftlint:disable function_body_length
    private func addIndividualItemConstraints(items: [UIView], mainView: UIView, padding: CGFloat) {

        items.enumerated().forEach { index, button in
            let topConstraint = NSLayoutConstraint(item: button,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: mainView,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0)

            let bottomConstraint = NSLayoutConstraint(item: button,
                                                      attribute: .bottom,
                                                      relatedBy: .equal,
                                                      toItem: mainView,
                                                      attribute: .bottom,
                                                      multiplier: 1.0,
                                                      constant: 0)

            var rightConstraint: NSLayoutConstraint!

            if index == items.count - 1 {

                rightConstraint = NSLayoutConstraint(item: button,
                                                     attribute: .right,
                                                     relatedBy: .equal,
                                                     toItem: mainView,
                                                     attribute: .right,
                                                     multiplier: 1.0,
                                                     constant: -padding)
            } else {

                let nextButton = items[index + 1]
                rightConstraint = NSLayoutConstraint(item: button,
                                                     attribute: .right,
                                                     relatedBy: .equal,
                                                     toItem: nextButton,
                                                     attribute: .left,
                                                     multiplier: 1.0,
                                                     constant: -padding)
            }
            var leftConstraint: NSLayoutConstraint!

            if index == 0 {

                leftConstraint = NSLayoutConstraint(item: button,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: mainView,
                                                    attribute: .left,
                                                    multiplier: 1.0,
                                                    constant: padding)
            } else {

                let prevButton = items[index - 1]
                leftConstraint = NSLayoutConstraint(item: button,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: prevButton,
                                                    attribute: .right,
                                                    multiplier: 1.0,
                                                    constant: padding)

                let firstItem = items[0]

                let widthConstraint = NSLayoutConstraint(item: button,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: firstItem,
                                                         attribute: .width,
                                                         multiplier: 1.0  ,
                                                         constant: 0)

                mainView.addConstraint(widthConstraint)
            }

            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }

    private func setSelectedColors() {

        labels.forEach { item in
            item.textColor = unselectedLabelColor
        }

        if labels.count > 0 {
            labels[0].textColor = selectedLabelColor
        }

        thumbView.backgroundColor = thumbColor
    }

    private func setFont() {
        for item in labels {
            item.font = font
        }
    }
}
