//
//  CustomPopUp.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/2/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

@IBDesignable
class CustomAlertController: UIViewController {

    public var blurEffect: UIBlurEffect.Style = .regular {
        didSet { configureAsAlert() }
    }

    open weak var blurBackgroundView: UIVisualEffectView?
    open weak var backgroundView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAsAlert()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisapear(animated)
    }

    private func configureAsAlert() {
        definesPresentationContext = true
        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.coverVertical
    }

    private func addBlurBackground(to view: UIView) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: self.blurEffect)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        blurView.frame = view.bounds
        view.addSubview(blurView)

        return blurView
    }

    private func addBackgroundView(to view: UIView) -> UIView {
        let backgroundView = UIView()

        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        backgroundView.frame = view.bounds
        view.addSubview(backgroundView)

        return backgroundView
    }

    private func willAppear() {
        guard let presenting = presentingViewController else { return }
        backgroundView = addBackgroundView(to: presenting.view)
        backgroundView?.backgroundColor = UIColor.gray
        backgroundView?.alpha = 0

        transitionCoordinator?.animate(
            alongsideTransition: { [weak backgroundView] _ in
                backgroundView?.alpha = 0.8
            }, completion: nil)
    }

    private func willDisapear(_ animated: Bool) {
        if !animated {
            self.dismiss(animated: false, completion: nil)
        }

        if let transitionCoordinator = transitionCoordinator {
            transitionCoordinator.animate(
                alongsideTransition: { [weak backgroundView] _ in
                    backgroundView?.alpha = 0
                }, completion: { [weak backgroundView] _ in
                    backgroundView?.removeFromSuperview()
            })

            transitionCoordinator.animate(
                alongsideTransition: { [weak blurBackgroundView] _ in
                    blurBackgroundView?.alpha = 0
                }, completion: { [weak blurBackgroundView] _ in
                    blurBackgroundView?.removeFromSuperview()
            })
        }
    }

    @IBAction private func dismissAlert() {
        dismiss(animated: true, completion: nil)
    }
}
