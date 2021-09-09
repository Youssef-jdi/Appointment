//
//  ApplicationNavigationController.swift
//  appointment
//
//  Created by Tran Gia Huy on 14/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class ApplicationNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Privates
private extension ApplicationNavigationController {

    func setup() {
         navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: R.font.notoSans(size: 16) as Any
        ]
        navigationBar.barTintColor = R.color.appDimGray()
        navigationBar.backIndicatorImage = R.image.navigationBar_Back_White()
        navigationBar.backIndicatorTransitionMaskImage = R.image.navigationBar_Back_White()

        navigationBar.tintColor = .white
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [
                .font: R.font.notoSans(size: 14) as Any,
                .foregroundColor: R.color.appGrayMagnesium() ?? UIColor.white
            ],
            for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [.font: R.font.notoSans(size: 14) as Any, .foregroundColor: UIColor.white],
            for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [.font: R.font.notoSans(size: 14) as Any, .foregroundColor: UIColor.white],
            for: .selected)
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        // https://stackoverflow.com/a/46152420
        navigationBar.setValue(true, forKey: "hidesShadow")
        // Enable pop gesture without navigation barbtw
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = R.color.appGray()
        delegate = self
    }
}

extension ApplicationNavigationController: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}

// MARK: - Navigation Controller Delegate
extension ApplicationNavigationController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { true }
}

extension UINavigationController {
    func drawTitle(with text: String) -> UIBarButtonItem {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = R.font.notoSans(size: 18)
        label.text = text
        return .init(customView: label)
    }

    #warning("Todo,17-Apr-2020, Custom it later base on the logic of workflow")
    func drawYearButton() -> UIBarButtonItem {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        let label = UILabel()
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 20, height: 20))
        label.text = "2009"
        label.font = R.font.notoSans(size: 16)
        label.textColor = .white
        imageView.image = R.image.pointer_Down_Black()
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(imageView)
        return .init(customView: stackView)
    }
}
