////
////  BaseViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 18/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Moya
//import SideMenuSwift
//
// typealias MVVMViewController = MVVMViewControllerProtocol
// 
// protocol MVVMViewControllerProtocol: class {
//    associatedtype ViewModel: MVVMViewModel
//    
//    var viewModel: ViewModel { get }
// }
//
// protocol MVVMSyncViewController: class {
//
//    associatedtype ViewModel: MVVMSyncViewModel
//
//    var viewModel: ViewModel { get }
// }
// 
//class BaseViewController: UIViewController, Themeable {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        prepareNavigationBar()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//
//    
//    func applyTheme(theme: ProductModel) {
//        let size = CGSize(width: 1, height: 1)
//        UIGraphicsBeginImageContext(size)
//        let context: CGContext = UIGraphicsGetCurrentContext()!
//        context.setFillColor(theme.firstColor!.cgColor)
//        context.fill(CGRect(origin: .zero, size: size))
//        let navbarImage = UIGraphicsGetImageFromCurrentImageContext()!
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.setBackgroundImage(navbarImage, for: .default)
//    }
//}
