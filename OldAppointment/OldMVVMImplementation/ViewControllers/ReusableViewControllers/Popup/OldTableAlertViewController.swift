////
////  TableAlertViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 28/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class TableAlertViewController: CustomAlertController, UITableViewDelegate, UITableViewDataSource, Storyboardable {
//   
//    static var storyboardName: String = "Popup"
//    static var storyboardIdentifier: String = "TableViewAlert"
//    
//    @IBOutlet private weak var alertTitle: UILabel! {
//        didSet {
//            alertTitle.font = R.font.openSansBold(size: 18)
//            alertTitle.textColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var alertImage: UIImageView!
//    @IBOutlet private weak var cancelButton: UIButton! {
//        didSet {
//            cancelButton.setAttributedTitle(NSAttributedString(string: R.string.localizable.cancel.key.localized.uppercased(), attributes: PopUpFontAttributes.newMemoToCancel.value), for: .normal)
//            cancelButton.backgroundColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//        }
//    }
//
//    typealias TableData = (text: String, image: UIImage)
//
//    struct ViewModel {
//        let alertTitle: String
//        let alertImage: UIImage
//        let wantedBlurViewBackground: Bool
//        let tableViewDataSource: [TableData]
//        let cellPressed: ((TableAlertViewController, Int) -> Void)?
//        let buttonTitle: String
//    }
//
//    var viewModel: ViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        configureAlert(withModel: viewModel)
//    }
//    
//    @IBAction private func cancelPressed(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func configureAlert(withModel viewModel: ViewModel) {
//        self.modalTransitionStyle = .crossDissolve
//        self.modalPresentationStyle = .overCurrentContext
//        alertTitle.text = viewModel.alertTitle
//        alertImage.image = viewModel.alertImage
//        cancelButton.setTitle(viewModel.buttonTitle, for: .normal)
//        isBlurViewEnabled = viewModel.wantedBlurViewBackground
//        tableViewHeight.constant = CGFloat(viewModel.tableViewDataSource.count) * tableView.rowHeight
//        tableView.reloadData()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.tableViewDataSource.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.alertTableViewCell.identifier) as? AlertTableViewCell else { return UITableViewCell() }
//        cell.prepareCell(image: viewModel.tableViewDataSource[indexPath.row].image, text: viewModel.tableViewDataSource[indexPath.row].text)
//
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.cellPressed?(self, indexPath.row)
//    }
//}
