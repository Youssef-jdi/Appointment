//
//  CustomPopUpViewController.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/2/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

enum PopUpType {
    case vertical
    case horizontal
}

protocol MultipleButtonAlertViewControllerProtocol {
    func set(viewModel: MultipleButtonAlertViewController.ViewModel)
}

class MultipleButtonAlertViewController: CustomAlertController, MultipleButtonAlertViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var popUpView: UIView!

    struct ViewModel {
        let type: PopUpType
        let cellType: MultipleButtonType
    }

    private var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismiss()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = viewModel else { return }
        configureAlert(withModel: viewModel)
    }

    func set(viewModel: MultipleButtonAlertViewController.ViewModel) {
        self.viewModel = viewModel
    }

    func configureAlert(withModel viewModel: ViewModel) {
        image.image = viewModel.cellType.mainImage
    }

    func setupDismiss() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }

    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

//swiftlint:disable implicit_return
extension MultipleButtonAlertViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.multipleButtonCell, for: indexPath) else { return UITableViewCell() }
        cell.cellImageView.image = viewModel?.cellType.cellImage[indexPath.row]
        cell.titleLabel.text = viewModel?.cellType.cellLabel[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 5
    }
}

extension MultipleButtonAlertViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let viewTouched = touch.view else { return true }
        guard viewTouched.isDescendant(of: popUpView) else { return true }
        return false
    }
}
