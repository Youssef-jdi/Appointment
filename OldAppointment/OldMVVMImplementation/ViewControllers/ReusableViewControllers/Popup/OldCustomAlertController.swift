////
////  CustomAlertController.swift
////  Panorama
////
////  Created by Tiziano Coroneo on 23/11/2018.
////  Copyright © 2018 DTT Multimedia. All rights reserved.
////
//
//import UIKit
//
//@IBDesignable
//class CustomAlertController: UIViewController {
//
//    public var blurEffect: UIBlurEffect.Style = .regular {
//        didSet { configureAsAlert() }
//    }
//
//    @IBInspectable var isBlurViewEnabled: Bool = false
//
//    open weak var blurBackgroundView: UIVisualEffectView?
//    open weak var backgroundView: UIView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureAsAlert()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        guard let presenting = presentingViewController else { return }
//
//        if isBlurViewEnabled {
//            blurBackgroundView = addBlurBackground(to: presenting.view)
//            blurBackgroundView?.alpha = 0
//
//            transitionCoordinator?.animate(
//                alongsideTransition: { [weak blurBackgroundView] _ in
//                    blurBackgroundView?.alpha = 0.9
//                }, completion: nil)
//        } else {
//
//            backgroundView = addBackgroundView(to: presenting.view)
//            backgroundView?.backgroundColor = UIColor.gray
//            backgroundView?.alpha = 0
//
//            transitionCoordinator?.animate(
//                alongsideTransition: { [weak backgroundView] _ in
//                    backgroundView?.alpha = 0.8
//                }, completion: nil)
//        }
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        transitionCoordinator?.animate(
//            alongsideTransition: { [weak backgroundView] _ in
//                backgroundView?.alpha = 0
//            }, completion: { [weak backgroundView] _ in
//                backgroundView?.removeFromSuperview()
//            })
//
//        transitionCoordinator?.animate(
//            alongsideTransition: { [weak blurBackgroundView] _ in
//                blurBackgroundView?.alpha = 0
//            }, completion: { [weak blurBackgroundView] _ in
//                blurBackgroundView?.removeFromSuperview()
//            })
//    }
//
//    private func configureAsAlert() {
//        definesPresentationContext = true
//        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        modalTransitionStyle = UIModalTransitionStyle.coverVertical
//    }
//
//    private func addBlurBackground(to view: UIView) -> UIVisualEffectView {
//        let blurEffect = UIBlurEffect(style: self.blurEffect)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//
//        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        blurView.frame = view.bounds
//        view.addSubview(blurView)
//
//        return blurView
//    }
//
//    private func addBackgroundView(to view: UIView) -> UIView {
//        let backgroundView = UIView()
//
//        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        backgroundView.frame = view.bounds
//        view.addSubview(backgroundView)
//
//        return backgroundView
//    }
//
//    @IBAction private func dismissAlert() {
//        dismiss(animated: true, completion: nil)
//    }
//}
