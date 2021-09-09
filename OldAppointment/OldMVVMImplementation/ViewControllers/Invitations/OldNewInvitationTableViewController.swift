////
////  NewInvitationTableViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 03/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import M13Checkbox
//import MapKit
//import GooglePlaces
//
//class NewInvitationTableViewController: UITableViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Invitation" }
//    static var storyboardIdentifier: String { return "NewInvitationTableViewController" }
//    
//    typealias ViewModel = NewInvitationViewModel
//    
//    // MARK: - Variables
//    var viewModel = ViewModel()
//    var suggestedLocationTableView: UITableView? {
//        didSet {
//            suggestedLocationTableView?.delegate = locationSearchDataSource
//            suggestedLocationTableView?.dataSource = locationSearchDataSource
//            suggestedLocationTableView?.rowHeight = UITableView.automaticDimension
//            suggestedLocationTableView?.estimatedRowHeight = 90
//        }
//    }
//    var blackBackground = UIView()
//    var textFieldArray: [UITextField] = []
//
//    // MARK: - Outlet
//    
//    @IBOutlet private weak var locationSearchDataSource: LocationSearchDataSource!
//    @IBOutlet private weak var mainTableView: UITableView!
//    
//    @IBOutlet private weak var titleTextField: UITextField! {
//        didSet {
//            titleTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var locationTextField: UITextField! {
//        didSet {
//            locationTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var descriptionTextField: UITextField! {
//        didSet {
//            descriptionTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var firstCheckBox: M13Checkbox!
//    @IBOutlet private weak var secondCheckBox: M13Checkbox!
//    
//    // MARK: - LifeCycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewModel.placesClient = GMSPlacesClient.shared()
//        generateTextFieldArray()
//        bindViewModel()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    // MARK: - Actions
//    
//    @IBAction private func locationTextFieldDidUpdate(_ sender: Any, forEvent event: UIEvent) {
//        guard let text = locationTextField.text else { return }
//        viewModel.textRequest = text
//        if !text.isEmpty {
//            viewModel.updateGoogleMapSearchResult()
//        }
//    }
//}
//extension NewInvitationTableViewController: Themeable {
//    func applyTheme(theme: ProductModel) {
//        firstCheckBox.tintColor = theme.firstColor
//        secondCheckBox.tintColor = theme.firstColor
//    }
//}
//
//extension NewInvitationTableViewController: UITextFieldDelegate {
//    
//    // MARK: - TextFieldDelegate
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        if textField == locationTextField && suggestedLocationTableView == nil {
//            addSearchContainerView()
//            textField.becomeFirstResponder()
//        }
//        return true
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        
//        switch textField {
//        case titleTextField:
//            locationTextField.becomeFirstResponder()
//        case locationTextField:
//            descriptionTextField.becomeFirstResponder()
//        default:
//            break
//        }
//        
//        return true
//    }
//    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if suggestedLocationTableView != nil {
//            removeSearchContainerView()
//        }
//        
//        return true
//    }
//}
//
//extension NewInvitationTableViewController {
//    
//    // MARK: - TableViewDelegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        if indexPath.section == 0 {
//            textFieldArray[indexPath.row].becomeFirstResponder()
//        }
//        
//        if indexPath.section == 2 {
//            if indexPath.row == 0 {
//                firstCheckBox.checkState = firstCheckBox.checkState == .checked ?
//                    .unchecked : .checked
//            } else {
//                secondCheckBox.checkState = secondCheckBox.checkState == .checked ?
//                    .unchecked : .checked
//            }
//        }
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
//extension NewInvitationTableViewController {
//    
//    // MARK: - Custom Function
//    func addSearchContainerView() {
//        let cell = mainTableView.cellForRow(at: IndexPath(row: 1, section: 0))!
//        let origin = CGPoint(x: cell.frame.minX, y: cell.frame.maxY)
//        let keyboardHeight = KeyboardService.keyboardHeight()
//        let height = self.view.frame.height - cell.frame.maxY
//        let tableViewSize = CGSize(width: self.view.frame.width, height: height - keyboardHeight)
//        let backgroundViewSize = CGSize(width: self.view.frame.width, height: height)
//        
//        blackBackground = UIView(frame: CGRect(origin: origin, size: backgroundViewSize))
//        blackBackground.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        blackBackground.alpha = 0
//        
//        suggestedLocationTableView = UITableView(frame: CGRect(origin: .zero, size: tableViewSize), style: .grouped)
//        suggestedLocationTableView!.backgroundColor = R.color.appLightGray()
//        suggestedLocationTableView?.alpha = 0
//        
//        self.view.addSubview(blackBackground)
//        self.blackBackground.addSubview(suggestedLocationTableView!)
//        
//        UIView.animate(withDuration: 0.2) {
//            self.blackBackground.alpha = 1
//        }
//        
//        self.viewModel.googleMapsToken = GMSAutocompleteSessionToken()
//    }
//    
//    func showSearchContainerView() {
//        UIView.animate(withDuration: 0.2) {
//            self.suggestedLocationTableView?.alpha = 1
//        }
//    }
//    
//    func removeSearchContainerView() {
//        
//        UIView.animate(withDuration: 0.2,
//                       animations: {
//                        self.blackBackground.alpha = 0
//        }) { _ in
//            self.blackBackground.removeFromSuperview()
//            self.suggestedLocationTableView = nil
//            self.viewModel.googleMapsToken = nil
//        }
//    }
//    
//    func generateTextFieldArray() {
//        textFieldArray.append(titleTextField)
//        textFieldArray.append(locationTextField)
//        textFieldArray.append(descriptionTextField)
//    }
//}
//
//// MARK: - Private Extension & Binding
//private extension NewInvitationTableViewController {
//    func bindViewModel() {
//        
//        locationSearchDataSource.didSelectCell = { [weak self] text in
//            self?.locationTextField.text = text
//            self?.removeSearchContainerView()
//            self?.locationTextField.resignFirstResponder()
//        }
//        
//        viewModel.didReceivedSearchResponse = { [weak self] response in
//            
//            if response {
//                guard let suggestedTableView = self?.suggestedLocationTableView else { return }
//                if suggestedTableView.alpha == 0 {
//                    self?.showSearchContainerView()
//                }
//                self?.locationSearchDataSource.matchingItems = (self?.viewModel.matchingItems)!
//                self?.suggestedLocationTableView?.reloadData()
//            }
//        }
//    }
//}
