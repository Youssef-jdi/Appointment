////
////  LinksTableViewController.swift
////  appointment
////
////  Created by Tran Gia Huy on 3/12/19.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class LinksTableViewController: UITableViewController, Storyboardable {
//    static var storyboardName: String { return "Settings" }
//    
//    static var storyboardIdentifier: String { return "LinksTableViewController" }
//    
//    @IBOutlet private var statusLabels: [UILabel]! {
//        didSet {
//            statusLabels.forEach {
//                $0.font = R.font.openSans(size: 13)
//                $0.textColor = R.color.appGrayChateau()!
//            }
//            statusLabels[0].text = R.string.localizable.off.key.localized.uppercased()
//            statusLabels[1].text = R.string.localizable.on.key.localized.uppercased()
//            statusLabels[2].text = R.string.localizable.failed.key.localized.uppercased()
//            statusLabels[3].text = R.string.localizable.off.key.localized.uppercased()
//            statusLabels[4].text = R.string.localizable.on.key.localized.uppercased()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupNavigation()
//    }
//    
//    func setupNavigation() {
//        self.navigationItem.title = R.string.localizable.connectedSettings.key.localized.capitalizingFirstLetter()
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//    }
//}
